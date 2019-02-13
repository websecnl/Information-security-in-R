Information-security-in-R
Cyber and Information security in R by Joel Aviad Ossi

*Note:* Not all files are contained within this repository due to file size limit on GitHub, To download the missing files of this R project you can get it from this URL: https://www.upload.ee/files/9566367/Cyber_and_Information_security_in_R_-_Missing_Resources.rar.html




(Below Source: https://www.sec.gov/dera/data/edgar-log-file-data-set.html)

EDGAR Log File Data set

The Division of Economic and Risk Analysis (DERA) has assembled information on internet search traffic for
EDGAR filings through SEC.gov.  The data is intended to provide insight into the usage of publicly accessible 
EDGAR company filings in a simple but extensive manner.  

The EDGAR Log File Data Set contains information in CSV format extracted from Apache log files that record and
store user access statistics for the SEC.gov website.  Due to certain limitations, including the existence of 
lost or damaged files, the information assembled by DERA may not capture all SEC.gov website traffic.

DERA intends to periodically update the data. 


1.	ip: This variable provides the first three octets of the IP address with the fourth octet obfuscated with a 3 character string that preserves the
        uniqueness of the last octet without revealing the full identity of the IP (###.###.###.xxx).  For example, all fourth octets of 150 will have the 
        same three character string across all files.
2.	date: Apache log file date
3.	time: Apache log file time
4.	zone: Apache log file zone
5.	cik: SEC Central Index Key (CIK) associated with the document requested
6.	accession: SEC document accession number associated with the document requested
7.	doc: This variable provides the filename of the file requested including the document extension.  If the filename is missing and only the file 
        extension is present, then the filename is the document accession number.
8.	code: Apache log file status code for the request
9.	filesize: document file size
10.	idx: takes on a value of 1 if the requester landed on the index page of a set of documents (e.g., - index.htm), and zero otherwise
11.	norefer: takes on a value of one if the Apache log file referrer field is empty, and zero otherwise
12.	noagent: takes on a value of one if the Apache log file user agent field is empty, and zero otherwise
13.	find: numeric values from 0 to 10, that correspond to whether the following character strings/[$string]/were found in the referrer field – 
        this could indicate how the document requester arrived at the document link (e.g., internal EDGAR search):
  a.	$find=0;
  b.	if($referrer=~m/.*(action\=getcompany)/){$find=1};            
  c.	if($referrer=~m/.*(action\=getcurrent)/){$find=2};            
  d.	if($referrer=~m/.*(Find\+Companies)/){$find=3};               
  e.	if($referrer=~m/.*(cgi\-bin\/srch\-edgar)/){$find=4};         
  f.	if($referrer=~m/.*(EDGARFSClient)/){$find=5};                 
  g.	if($referrer=~m/.*(cgi\-bin\/current)/){$find=6};             
  h.	if($referrer=~m/.*(Archives\/edgar)/){$find=7};               
  i.	if($referrer=~m/.*(cgi\-bin\/viewer)/){$find=8};              
  j.	if($referrer=~m/.*(.*\-index)/){$find=9};
  k.	if($find==0 && $referrer ne "-" && $referrer ne ""){$find=10};
14.	crawler: This variable takes on a value of one if the user agent self-identifies as one of the following webcrawlers or has a user code of 404.
        Below are the actual Perl regular expressions used:
  a.	if($agent=~m/(wget|Googlebot|polybot|Yahoo\!\s*Slurp|spider|robot|perl|python|lwp|crawler)/i){$crawl=1};
  b.	if($code==404){$crawl=1};
15.	browser: This variable is a three character string that identifies potential browser type by analyzing whether the user agent field contained the 
        following /[text]/.  Below are the actual Perl regular expressions used:
  a.	if($agent=~m/MSIE/){$browser="mie"};
  b.	if($agent=~m/Firefox/){$browser="fox"};
  c.	if($agent=~m/Safari/){$browser="saf"};
  d.	if($agent=~m/Chrom/){$browser="chr"};                    
  e.	if($agent=~m/Seamonk/){$browser="sea"};
  f.	if($agent=~m/Opera/){$browser="opr"};
  g.	if($agent=~m/(DoCoMo|KDDI|Cricket|Vodaphone)/){$browser="oth"};
  h.	if($agent=~m/Windows\s*NT/){$browser="win"};
  i.	if($agent=~m/Mac\s*OS/i){$browser="mac"};
  j.	if($agent=~m/Linux/i){$browser="lin"};
  k.	if($agent=~m/iPhone/){$browser="iph"};
  l.	if($agent=~m/iPad/){$browser="ipd"};
  m.	if($agent=~m/Android/){$browser="and"};
  n.	if($agent=~m/(BB10|PlayBook|BlackBerry)/){$browser="rim"};
  o.	if($agent=~m/(IEMobile|Windows\s*CE|Windows\s*Phone)/){$browser="iem"};
