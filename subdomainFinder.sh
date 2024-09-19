#!/bin/bash

# this script is combination of subdinder, chaos, amass, assetfinder, findomain, 

# Define target domain
read -p "Enter the domain:" domain

# Use subfinder to find subdomains
echo "Finding subdomains using subfinder..."
subfinder -d $domain | tee -a subdomains.txt

# Use chaos to find subdomains
echo "Finding subdomains using chaos..."
chaos -d $domain | tee -a subdomains.txt

# Use Amass to find subdomains
echo "Finding subdomains using Amass..."
amass enum -d $domain -brute -o subdomains.txt

# Use assetfinder to find subdomains
echo "Finding subdomains using assetfinder..."
assetfinder $domain | tee -a subdomains.txt

# Use findomain to find subdomains
echo "Finding subdomains using findomain..."
findomain -t $domain | tee -a subdomains.txt

# Remove duplicates from the list
echo "Removing duplicates..."
sort -u subdomains.txt -o subdomains.txt
