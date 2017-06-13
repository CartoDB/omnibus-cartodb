#
# Copyright 2012-2014 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "cacerts"

default_version "2017-01-18"

source url: "https://curl.haxx.se/ca/cacert-#{version}.pem"

version("2017-01-18") { source sha256: "e62a07e61e5870effa81b430e1900778943c228bd7da1259dd6a955ee2262b47" }

version "2016-04-20" do
  source md5: "782dcde8f5d53b1b9e888fdf113c42b9"
end

version "2016.01.20" do
  source md5: "06629db7f712ff3a75630eccaecc1fe4"
  source url: "https://curl.haxx.se/ca/cacert-2016-01-20.pem"
end

version "2015.10.28" do
  source md5: "6f41fb0f0c4b4695c2a6296892278141"
end

version "2015.09.02" do
  source md5: "3e0e6f302bd4f5b94040b8bcee0ffe15"
end

version "2015.04.22" do
  source md5: "380df856e8f789c1af97d0da9a243769"
end

version "2015.02.25" do
  source md5: "19e7f27540ee694308729fd677163649"
end

version "2014.09.03" do
  source md5: "d7f7dd7e3ede3e323fc0e09381f16caf"
end

version "2014.08.20" do
  source md5: "c9f4f7f4d6a5ef6633e893577a09865e"
end

version "2014.07.15" do
  source md5: "fd48275847fa10a8007008379ee902f1"
end

version "2014.04.22" do
  source md5: "9f92a0d9f605e227ae068e605f4c86fa"
end

version "2014.01.28" do
  source md5: "5d108f8ab86afacc6663aafca8604dd3"
end

relative_path "cacerts-#{version}"

build do
  mkdir "#{install_dir}/embedded/ssl/certs"

  # Append the 1024bit Verisign certs so that S3 continues to work
  block do
    unless File.foreach("#{project_dir}/cacert-#{version}.pem").grep(/^Verisign Class 3 Public Primary Certification Authority$/).any?
      File.open("#{project_dir}/cacert-#{version}.pem", "a") { |fd| fd.write(VERISIGN_CERTS) }
    end
  end

  copy "#{project_dir}/cacert-#{version}.pem", "#{install_dir}/embedded/ssl/certs/cacert.pem"

  # Windows does not support symlinks
  unless windows?
    link "#{install_dir}/embedded/ssl/certs/cacert.pem", "#{install_dir}/embedded/ssl/cert.pem"

    block { File.chmod(0644, "#{install_dir}/embedded/ssl/certs/cacert.pem") }
  end
end

VERISIGN_CERTS = <<-EOH

Verisign Class 3 Public Primary Certification Authority
=======================================================
-----BEGIN CERTIFICATE-----
MIICPDCCAaUCEHC65B0Q2Sk0tjjKewPMur8wDQYJKoZIhvcNAQECBQAwXzELMAkGA1UEBhMCVVMx
FzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAzIFB1YmxpYyBQcmltYXJ5
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTk2MDEyOTAwMDAwMFoXDTI4MDgwMTIzNTk1OVow
XzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAz
IFB1YmxpYyBQcmltYXJ5IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIGfMA0GCSqGSIb3DQEBAQUA
A4GNADCBiQKBgQDJXFme8huKARS0EN8EQNvjV69qRUCPhAwL0TPZ2RHP7gJYHyX3KqhEBarsAx94
f56TuZoAqiN91qyFomNFx3InzPRMxnVx0jnvT0Lwdd8KkMaOIG+YD/isI19wKTakyYbnsZogy1Ol
hec9vn2a/iRFM9x2Fe0PonFkTGUugWhFpwIDAQABMA0GCSqGSIb3DQEBAgUAA4GBALtMEivPLCYA
TxQT3ab7/AoRhIzzKBxnki98tsX63/Dolbwdj2wsqFHMc9ikwFPwTtYmwHYBV4GSXiHx0bH/59Ah
WM1pF+NEHJwZRDmJXNycAA9WjQKZ7aKQRUzkuxCkPfAyAw7xzvjoyVGM5mKf5p/AfbdynMk2Omuf
Tqj/ZA1k
-----END CERTIFICATE-----

Verisign Class 3 Public Primary Certification Authority
=======================================================
-----BEGIN CERTIFICATE-----
MIICPDCCAaUCEDyRMcsf9tAbDpq40ES/Er4wDQYJKoZIhvcNAQEFBQAwXzELMAkGA1UEBhMCVVMx
FzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAzIFB1YmxpYyBQcmltYXJ5
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTk2MDEyOTAwMDAwMFoXDTI4MDgwMjIzNTk1OVow
XzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMTcwNQYDVQQLEy5DbGFzcyAz
IFB1YmxpYyBQcmltYXJ5IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIGfMA0GCSqGSIb3DQEBAQUA
A4GNADCBiQKBgQDJXFme8huKARS0EN8EQNvjV69qRUCPhAwL0TPZ2RHP7gJYHyX3KqhEBarsAx94
f56TuZoAqiN91qyFomNFx3InzPRMxnVx0jnvT0Lwdd8KkMaOIG+YD/isI19wKTakyYbnsZogy1Ol
hec9vn2a/iRFM9x2Fe0PonFkTGUugWhFpwIDAQABMA0GCSqGSIb3DQEBBQUAA4GBABByUqkFFBky
CEHwxWsKzH4PIRnN5GfcX6kb5sroc50i2JhucwNhkcV8sEVAbkSdjbCxlnRhLQ2pRdKkkirWmnWX
bj9T/UWZYB2oK0z5XqcJ2HUw19JlYD1n1khVdWk/kfVIC0dpImmClr7JyDiGSnoscxlIaU5rfGW/
D/xwzoiQ
-----END CERTIFICATE-----

-----BEGIN CERTIFICATE-----
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
Rn3GJVY=
-----END CERTIFICATE-----

EOH
