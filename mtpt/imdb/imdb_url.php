<?php
//用于生成一段对ajax的响应html，供用户选择最正确的信息
//by SamuraiMe,2013.05.19
error_reporting(0);//由于第三方网站不稳定..so..

$type = $_GET["type"];
$title = $_GET["title"];
$res = $_GET["res"];

if ($res == "imdb") {
	switch ($type) {
		case '401':
		case '402':
		case '404':
		case '405':
		case '414':
			echo searchImdb($title);
			break;
		
		default:
			break;
	}
} else if ($res == "douban"){
	switch ($type) {
		case '401':
		case '402':
		case '404':
		case '405':
		case '414':
			echo searchDoubanMovie($title);
			break;
		
		default:
			break;
	}
}


/**
* 根据关键字获取对应的条目id及其它
*	
* @link http://developers.douban.com/wiki/
*
*/
function searchDoubanMovie($q, $count = 10) {
	$basicUrl = "http://api.douban.com/v2/movie/search";
	$requestUrl = $basicUrl . "?q=" . $q . "&count=" . $count;
	$data = file_get_contents($requestUrl);
	$data = json_decode($data);
	if ($data->total == 0) {
		return false;
	}

	$html = '<div id="select_douban"><p>请在所列出的信息里选择一个正确的信息，没有正确的可以不选取</p><table>';
	$html .= '<tr><th></th><th>电影名</th><th>原始名称</th><th>上映时间</th><th>选择</th></tr>';
	$count = 0;
	foreach ($data->subjects as $item) {
		$count ++;
		$html .= "<tr class=\"douban_item\"><td><a href=\"{$item->alt}\">$count</a></td><td>{$item->title}</td><td>{$item->original_title}</td><td>{$item->year}</td><td><input type=\"button\" value=\"是这个\"></td></tr>";
	}
	$html .= '</table></div>';
	return $html;
}

/**
*
*
* @link http://imdbapi.org
*
*/
function searchIMDB($title, $limit = 10) 
{
	$requestUrl = "http://mymovieapi.com/?title=$title&type=json&limit=$limit";
	$data = file_get_contents($requestUrl);
	$data = json_decode($data);
	if ($data->code == 404) {
		return false;
	} else {
		$html = '<div id="select_imdb"><p>请在所列出的信息里选择一个正确的信息，没有正确的可以不选取</p><table>';
		$html .= '<tr><th></th><th>title</th><th>year</th><th>country</th><th>language</th><th>directors</th></tr>';
		$count = 0;
		foreach ($data as $key => $item) {
			$count ++;
			$html .= "<tr class=\"imdb_item\"><td><a href=\"{$item->imdb_url}\">$count</a></td><td>{$item->title}</td><td>{$item->year}</td><td>".getListString($item->country)."</td><td>".getListString($item->language)."</td><td>".getListString($item->directors)."</td><td><input type=\"button\" value=\"是这个\"></td></tr>";
		}
		$html .= '</table></div>';

		return $html;
	}
}

function getListString($list)
{
	return implode(" /", $list);
}
?>