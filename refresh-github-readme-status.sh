#!/usr/bin/env bash

# Delays
hour=$(date "+%k")
sleep $((hour * 2 * 60))

# Maintaining the cache through timed access

wget -O readme.json "https://github.com/KevinsBobo/KevinsBobo/blob/main/README.md" > /dev/null 2>&1

# Read readme.json as a string and extract the src image url of the first two html img in it
readme=$(cat readme.json)

urls=$(echo $readme | grep -oP '(?<=<img src=\\").*?(?=\\" align=\\"right\\" alt=\\"KevinsBobo)')

# Split the urls string into two variables in lines
img1=$(echo $urls | awk -F ' ' '{print $1}')
img2=$(echo $urls | awk -F ' ' '{print $2}')

# echo $img1
# echo $img2

# Download the picture and overwrite it
wget --no-check-certificate -O github-status.svg $img1 > /dev/null 2>&1
wget --no-check-certificate -O github-language.svg $img2 > /dev/null 2>&1

# wget --no-check-certificate -O github-status.svg "https://camo.githubusercontent.com/ec72a8fb26b978e289e0f6dd26e9efd20095931d8e1a97f50f38dce1955b6ed2/68747470733a2f2f6769746875622d726561646d652d73746174732d6d752d6f7270696e2e76657263656c2e6170702f6170693f757365726e616d653d6b6576696e73626f626f2673686f775f69636f6e733d747275652669636f6e5f636f6c6f723d31453930464626746578745f636f6c6f723d3639363936392662675f636f6c6f723d66666666666626696e636c7564655f616c6c5f636f6d6d6974733d7472756526686964653d69737375657326637573746f6d5f7469746c653d4d79253230476974687562253230537461747573253230253238696e636c75646525323070726976617465253230636f6e747269627574696f6e73253239" > /dev/null 2>&1
# wget --no-check-certificate -O github-language.svg "https://camo.githubusercontent.com/e0cf662953e2c68062da8039b185b80fa51e27091dcc16deb2089d548e002fb3/68747470733a2f2f6769746875622d726561646d652d73746174732d6d752d6f7270696e2e76657263656c2e6170702f6170692f746f702d6c616e67732f3f757365726e616d653d6b6576696e73626f626f266c61796f75743d636f6d7061637426686964653d526f66662c6373732c68746d6c2c504850" > /dev/null 2>&1

# wget --no-check-certificate -O github-status.svg "https://github-readme-stats-mu-orpin.vercel.app/api?username=kevinsbobo&show_icons=true&icon_color=1E90FF&text_color=696969&bg_color=ffffff&include_all_commits=true&hide=issues&custom_title=My%20Github%20Status%20%28include%20private%20contributions%29" > /dev/null 2>&1
# wget --no-check-certificate -O github-language.svg "https://github-readme-stats-mu-orpin.vercel.app/api/top-langs/?username=kevinsbobo&layout=compact&hide=Roff,css,html,PHP" > /dev/null 2>&1
