<?php

function word_limit($string, $limit)
{

    $word = explode(" ", $string);
    return implode(" ", array_splice($word, 0, $limit));
}

function statusPesan($status)
{
    switch ($status) {
        case '0':
            $pesan = 'Belum dibayar!';
            break;

        case '1':
            $pesan = 'Pesanan Sedang diproses!';
            break;

        case '2':
            $pesan = 'Paket Sedang dalam pengiriman';
            break;
        case '3':
            $pesan = 'diterima';
            break;


        default:
           $pesan = 'tidak diketahui';
            break;
    }
    return $pesan;
}
