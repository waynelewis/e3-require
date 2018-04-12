#  Copyright (c) 2017 - Present  Jeong Han Lee
#  Copyright (c) 2017 - Present  European Spallation Source ERIC
#
#  The program is free software: you can redistribute
#  it and/or modify it under the terms of the GNU General Public License
#  as published by the Free Software Foundation, either version 2 of the
#  License, or any newer version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
#  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
#  more details.
#
#  You should have received a copy of the GNU General Public License along with
#  this program. If not, see https://www.gnu.org/licenses/gpl-2.0.txt
# 
#   Shell   : setE3Env.bash
#   Author  : Jeong Han Lee
#   email   : jeonghan.lee@gmail.com
#   date    : Thursday, April 12 18:10:14 CEST 2018
#
#   version : 0.1.0



base_ver=$1
require_ver=$2

if [ -z "$require_ver" ]; then
    require_ver="0.0.0"
fi

if [ -z "$base_ver" ]; then
    base_ver="3.15.5"
fi



unset EPICS_BASE
unset EPICS_HOST_ARCH
unset E3_REQUIRE_NAME
unset E3_REQUIRE_VERSION
unset E3_REQUIRE_LOCATION

unset E3_REQUIRE_BIN
unset E3_REQUIRE_LIB
unset E3_REQUIRE_INC
unset E3_REQUIRE_DB

unset E3_SITEMODS_PATH
unset E3_SITELIBS_PATH
unset E3_SITEAPPS_PATH


unset EPICS_DRIVER_PATH

unset PATH
unset LD_LIBRARY_PATH


#ESS_LIBS=/opt/ess
#ESS_ETHERLAB=/opt/etherlab
#ESS_OPCUA=${ESS_LIBS}/opcUa
#ESS_ETHERLAB=${ESS_LIBS}/etherlab

#export ESS_OPCUA_LIB=${ESS_OPCUA}/lib
#export ESS_OPCUA_INC=${ESS_OPCUA}/include
#export ESS_OPCUA_BIN=${ESS_OPCUA}/bin


# export ESS_ETHERLAB_LIB=${ESS_ETHERLAB}/lib
# export ESS_ETHERLAB_BIN=${ESS_ETHERLAB}/bin
# export ESS_ETHERLAB_SBIN=${ESS_ETHERLAB}/sbin


# shared libs seach directory by require.c
#
# EPICS_DRIVER_PATH

EPICS_BASE=/testing/epics/base-3.15.5
EPICS_HOST_ARCH=$("${EPICS_BASE}/startup/EpicsHostArch.pl")


# Select REQUIRE Environment Variables

E3_REQUIRE_NAME=require
E3_REQUIRE_VERSION=${require_ver}
E3_REQUIRE_LOCATION=${EPICS_BASE}/${E3_REQUIRE_NAME}/${E3_REQUIRE_VERSION}

E3_REQUIRE_BIN=${E3_REQUIRE_LOCATION}/bin
E3_REQUIRE_LIB=${E3_REQUIRE_LOCATION}/lib
E3_REQUIRE_INC=${E3_REQUIRE_LOCATION}/include
E3_REQUIRE_DB=${E3_REQUIRE_LOCATION}/db
E3_REQUIRE_DBD=${E3_REQUIRE_LOCATION}/dbd
E3_REQUIRE_TOOLS=${E3_REQUIRE_LOCATION}/tools

E3_SITEMODS_PATH=${E3_REQUIRE_LOCATION}/siteMods
E3_SITELIBS_PATH=${E3_REQUIRE_LOCATION}/siteLibs
E3_SITEAPPS_PATH=${E3_REQUIRE_LOCATION}/siteApps


EPICS_DRIVER_PATH=${E3_SITEMODS_PATH}


export EPICS_BASE
export EPICS_HOST_ARCH
export E3_REQUIRE_NAME
export E3_REQUIRE_VERSION
export E3_REQUIRE_LOCATION

export E3_REQUIRE_BIN
export E3_REQUIRE_LIB
export E3_REQUIRE_INC
export E3_REQUIRE_DB
export E3_REQUIRE_DBD

export E3_SITEMODS_PATH
export E3_SITELIBS_PATH
export E3_SITEAPPS_PATH


export EPICS_DRIVER_PATH



export PATH=${E3_REQUIRE_BIN}:${EPICS_BASE}/bin/${EPICS_HOST_ARCH}:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/sbin:${HOME}/bin

export LD_LIBRARY_PATH=${EPICS_BASE}/lib/${EPICS_HOST_ARCH}:${E3_REQUIRE_LIB}/${EPICS_HOST_ARCH}:/usr/local/lib:${HOME}/lib:${E3_SITE_LIBS}
