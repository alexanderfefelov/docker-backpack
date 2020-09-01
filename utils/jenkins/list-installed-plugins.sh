#!/usr/bin/env bash

http --verbose GET "http://admin_cahorthelvau:unatrustyphe@jenkins.backpack.test:8083/pluginManager/api/json?pretty=1&tree=plugins[longName,shortName,version]"
