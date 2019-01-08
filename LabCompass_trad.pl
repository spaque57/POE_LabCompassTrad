#!/usr/bin/perl -w
use strict;
use warnings;
use JSON;

# Script created by spaque for Path of Exile french fans
# You need an dictionnary file with translation of area names, like (tab separated): basilica'\t'basilique 
# You need a lab file in JSON format from poelab.com
# Run script: ./LabCompass_trad.pl dictionnary.txt merciless-2019-01-08.json output_name

# Release 0.1 - 01/08/2019


my %h_dico; # dictionnary of translations
my $trad_en_fr = $ARGV[0]; # file with english words and translation (sep by \t)
my $labfile = $ARGV[1]; # file with the lab (json)
my $namer = "Translated_".$ARGV[2].".json"; # name for the results
my $json_trad = ""; # results

# create dictionnary
open(F1,$trad_en_fr)|| die ("probleme d'ouverture du fichier $trad_en_fr");
while(<F1>)
	{
	chomp $_;
	my @trad = split("\t", $_);
	$h_dico{$trad[0]} = $trad[1];
	}
close F1;

# translate the lab
my $lab="";
open(F2,$labfile)|| die ("probleme d'ouverture du fichier $labfile");
while(<F2>)
	{
	chomp $_;
	$lab = $lab.$_;
	}
close F2;
$lab=~ s/\r+//;

my $decoded = decode_json($lab);
my @rooms = @{ $decoded->{'rooms'} };
foreach my $r (@rooms)
	{
	my $room = $r->{"name"};
	chomp $room;
	$room=~ s/\r+//;
	print STDERR "$room\n";
	my @sufpref = split(/\s+/, $room);
	# trad
	my $room_trad = "";
	my $first = 0;
	foreach my $a (@sufpref) 
		{
		if (defined $h_dico{$a} && $first == 0) { $room_trad = $h_dico{$a}; $first++;}
		elsif (defined $h_dico{$a} && $first > 0) { $room_trad = $room_trad." ".$h_dico{$a};}
		elsif (!defined $h_dico{$a}) { print STDERR "Room name not find (EN word): $a\n";}
		}	
	$r->{"name"} = $room_trad;
	}
open my $fh, ">", "$namer";
print $fh encode_json($decoded);
close $fh;



















