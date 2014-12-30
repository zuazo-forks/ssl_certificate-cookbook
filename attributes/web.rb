# encoding: UTF-8
#
# Cookbook Name:: ssl_certificate
# Attributes:: web
# Author:: Xabier de Zuazo (<xabier@onddo.com>)
# Copyright:: Copyright (c) 2014 Onddo Labs, SL. (www.onddo.com)
# License:: Apache License, Version 2.0
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

default['ssl_certificate']['web']['cipher_suite'] = nil
default['ssl_certificate']['web']['protocol'] = nil
default['ssl_certificate']['web']['compatibility'] = nil

# SSL Recommended configurations from
# https://wiki.mozilla.org/Security/Server_Side_TLS#Recommended_configurations

old = default['ssl_certificate']['web']['old']
old['description'] = 'Old backward compatibility: Windows XP IE6, Java 6'
old['cipher_suite'] =
  'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:'\
  'ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:'\
  'DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:'\
  'ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:'\
  'ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:'\
  'ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:'\
  'DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:'\
  'DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:'\
  'ECDHE-RSA-DES-CBC3-SHA:ECDHE-ECDSA-DES-CBC3-SHA:'\
  'AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:'\
  'AES256-SHA:'\
  'AES:'\
  'DES-CBC3-SHA:'\
  'HIGH:'\
  '!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:'\
  '!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA'
old['protocol'] = 'all -SSLv2'

intermediate = default['ssl_certificate']['web']['intermediate']
intermediate['description'] =
  'Intermediate compatibility: Firefox 1, Chrome 1, IE 7, Opera 5, Safari 1, '\
  'Windows XP IE8, Android 2.3, Java 7'
intermediate['cipher_suite'] =
  'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:'\
  'ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:'\
  'DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:'\
  'ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:'\
  'ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:'\
  'ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:'\
  'DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:'\
  'DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:'\
  'AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:'\
  'AES256-SHA:AES:'\
  'CAMELLIA:'\
  'DES-CBC3-SHA:'\
  '!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:'\
  '!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA'
intermediate['protocol'] = 'all -SSLv2 -SSLv3'

modern = default['ssl_certificate']['web']['modern']
modern['description'] =
  'Modern compatibility: Firefox 27, Chrome 22, IE 11, Opera 14, Safari 7, '\
  'Android 4.4, Java 8'
modern['cipher_suite'] =
  'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:'\
  'ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:'\
  'DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:'\
  'ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:'\
  'ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:'\
  'ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:'\
  'DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:'\
  'DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:'\
  '!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK'
modern['protocol'] = 'all -SSLv2 -SSLv3 -TLSv1'
