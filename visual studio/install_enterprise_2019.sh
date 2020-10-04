#!/bin/bash
vs2019_link_url="https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=enterprise&rel=16&utm_medium=microsoft&utm_source=docs.microsoft.com&utm_campaign=offline+install&utm_content=download+vs2019"
build2019_link_url="https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=buildtools&rel=16&utm_medium=microsoft&utm_source=docs.microsoft.com&utm_campaign=offline+install&utm_content=download+vs2019"
download_path="c:\\env\\vs2019\\installer"


aria2c -c -d $download_path $vs2019_link_url
aria2c -c -d $download_path $vs2019_link_url