#!/bin/sh

cat ./kanjinum.txt | awk '
{
  if (match($0, /[一二三四五六七八九十百千万億兆〇]+/)) {

    total = 0
    num = substr($0, RSTART, RLENGTH)
    for (i=1; i <= RLENGTH; i++){
      switch(substr(num, i, 1)) {
        case "一":
          total+=1
          break
        case "二":
          total+=2
          break
        case "三":
          total+=3
          break
        case "四":
          total+=4
          break
        case "五":
          total+=5
          break
        case "六":
          total+=6
          break
        case "七":
          total+=7
          break
        case "八":
          total+=8
          break
        case "九":
          total+=9
          break
        case "十":
          if (total==0) total=10
          else total*=10
          break
        case "百":
          if (total==0) total=100
          else total*=100
          break
        case "千":
          if (total==0) total=1000
          else total*=1000
          break
        case "兆":
          if (total==0) total=1000000000000
          else total*=1000000000000
          break
      }
    }
    gsub(/[一二三四五六七八九十百千万億兆〇]+/, total, $0)
  }
  print $0
}
'
