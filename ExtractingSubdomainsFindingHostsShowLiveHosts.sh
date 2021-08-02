#Extracting Subdomains And Finding Thier Hosts(IPs):- 
grep "href=" index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | sort -u > urls
for url in $(cat urls); do host $url | grep "has address" | cut -d " " -f 4 >> ips ; done
sort -u ips > IPsResult
rm ips
cat IPsResult
#Knowing LiveHosts :-
for ip in $(cat IPsResult); do ping -c 1 $ip | grep "bytes from" | cut -d ":" -f 1 >> LiveHosts ; done
sort -u LiveHosts > LiveHostsResult
rm LiveHosts
echo "################";
echo "# Live Hosts:- #";
echo "################"; 
cat LiveHostsResult
