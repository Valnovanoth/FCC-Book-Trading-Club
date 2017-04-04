<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Html_Grabber {
    var $error = '';
    var $html = '';

    function grabhtml($url, $start, $end) {
        $file = file_get_contents($url);

        if ($file) {
            if (preg_match_all("#$start(.*?)$end#s", $file, $match)) {
                $this->html = $match;
            } else {
                $this->error = "Tags cannot be found.";
            }
        } else {
            $this->error = "Site cannot be found!";
        }
    }

    function strip($html, $show, $start, $end) {
        if (!$show) {
            $html = str_replace($start, "", $html);
            $html = str_replace($end, "", $html);

            return $html;
        } else {
            return $html;
        }
    }

}

?>