<?php

// Задание 1
function palindrom(string $str): bool
{
    $str = str_replace([' ', '.', ',', '!', '?', ':', '-', ';'], '', $str);
    $str = mb_strtolower($str);
    $chars = mb_str_split($str, 1, 'UTF-8');
    $len = count($chars);
    for ($i = 0; $i < $len; $i++) {
        if ($chars[$i] != $chars[$len - $i - 1]) {
            return false;
        }
    }

    return true;
}

$str1 = 'Аргентина манит негра';
var_dump(palindrom($str1));

// Задание 2
function grab_number_sum(string $str): bool
{
    $num = '';
    $sum = 0;
    for ($i = 0; $i < strlen($str); $i++) {
        if (is_numeric($str[$i])) {
            $num .= $str[$i];
        } else {
            $sum = $sum + intval($num);
            $num = '';
        }
    }
    return $sum + intval($num);
}

$str2 = "900коко50кудахкукарек25коко25";
var_dump(grab_number_sum($str2));

// Задание 3
function proverka(string $str): bool
{
    $stack = [];
    $pairs = [
        '(' => ')',
        '[' => ']',
        '{' => '}'
    ];

    for ($i = 0; $i < strlen($str); $i++) {
        if (array_key_exists($str[$i], $pairs)) {
            array_push($stack, $str[$i]);
        } else {
            $open = array_pop($stack);
            if ($open === null || $pairs[$open] !== $str[$i]) {
                return false;
            }
        }
    }

    return count($stack) === 0;
}

$str3 = "(){}[]";
var_dump(proverka($str3));
