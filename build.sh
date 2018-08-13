#!/bin/bash

graal_download_url=https://github.com/oracle/graal/releases/download/vm-1.0.0-rc5/graalvm-ce-1.0.0-rc5-macos-amd64.tar.gz
local_graal_dir=.graalvm
local_graal_archive=${local_graal_dir}/graalvm.tar.gz
local_graal_archive_status=${local_graal_dir}/.archive_ok
javac=${local_graal_dir}/Contents/Home/bin/javac
nativeimage=${local_graal_dir}/Contents/Home/bin/native-image

cd "$(dirname "$0")"

download_graal_archive () {
  echo "Downloading GraalVM distribution from ${graal_download_url}"
  wget -q --show-progress -O ${local_graal_archive} ${graal_download_url} 
  if [ $? -ne 0 ]; then
    echo "Could not retrieve GraalVM"
    return 1
  else
    touch ${local_graal_archive_status}
    return 0
  fi
}

download_graal_test() {
  if [ ! -e ${local_graal_archive_status} ]; then
    return 0
  else
    return 1
  fi
}

extract_graalvm_test() {
  if [ ! -e ${javac} ] || [ ! -e ${nativeimage} ] ; then    
    return 0
  else
    echo "${javac} and ${nativeimage} are available"
    return 1
  fi
}

extract_graal_archive() {
  tar -xzf ${local_graal_archive} --strip 1 -C ${local_graal_dir}
}

download_graal_test
if [ $? -eq 0 ]; then
  mkdir -p .graalvm
  download_graal_archive
fi

extract_graalvm_test
if [ $? -eq 0 ]; then
  extract_graal_archive
fi

${javac} Haystack.java
${nativeimage} Haystack
