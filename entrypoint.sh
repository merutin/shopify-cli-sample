#!/bin/bash

service nginx start
cd theme 
shopify theme dev --store ${STORE} 
