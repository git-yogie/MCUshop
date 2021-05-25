<?php

function word_limit ($string, $limit){
 
    $word = explode(" ", $string);
    return implode(" ",array_splice($word, 0, $limit));

}