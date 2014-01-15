#!/bin/bash

#
#/**
# * Copyright 2007 The Apache Software Foundation
# *
# * Licensed to the Apache Software Foundation (ASF) under one
# * or more contributor license agreements.  See the NOTICE file
# * distributed with this work for additional information
# * regarding copyright ownership.  The ASF licenses this file
# * to you under the Apache License, Version 2.0 (the
# * "License"); you may not use this file except in compliance
# * with the License.  You may obtain a copy of the License at
# *
# *     http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# */

bin=`dirname "${BASH_SOURCE-$0}"`
bin=`cd "$bin">/dev/null; pwd`

. $bin/common.sh

ZAN_CLI=com.nflabs.zeppelin.cli.ZANCli
ZEPPELIN_LOGFILE=$ZEPPELIN_LOG_DIR/zan-cli-$ZEPPELIN_IDENT_STRING-$HOSTNAME.log
JAVA_OPTS+=" -Dzeppelin.log.file=$ZEPPELIN_LOGFILE"

if [ $DEBUG -gt 0 ]; then
  echo "Runing: $ZEPPELIN_RUNNER $JAVA_OPTS -cp $CLASSPATH $ZAN_CLI " $@""
fi
$ZEPPELIN_RUNNER $JAVA_OPTS -cp $CLASSPATH $ZAN_CLI "$@"
