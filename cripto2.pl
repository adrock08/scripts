#!/usr/bin/perl

#use warnings;
use Switch;

my ($cadena, $corrimiento, $accion, $uni) = @ARGV;

%numeros = (
	
0 => 0,
1 => 1,
2 => 2,
3 => 3,
4 => 4,
5 => 5,
6 => 6,
7 => 7,	
8 => 8,
9 => 9,
' '=> 10,
);

%numbers = (
	
0 => 0,
1 => 1,
2 => 2,
3 => 3,
4 => 4,
5 => 5,
6 => 6,
7 => 7,	
8 => 8,
9 => 9,
10 => ' ',


);

%alfabeto =(
A => 0,
B => 1,
C => 2,
D => 3,
E => 4,
F => 5,
G => 6,
H => 7,	
I => 8,
J => 9,
K => 10,
L => 11,
M => 12,
N => 13,
O => 14,
P => 15,
Q => 16,
R => 17,
S => 18,
T => 19,
U => 20,
V => 21,
W => 22,
X => 23,
Y => 24,
Z => 25,
'0'=> 26,
'1'=> 27,
'2'=> 28,
'3'=> 29,
4=> 30,
5=> 31,
6=> 32,
7=> 33,
8=> 34,
9=> 35, 
' ' =>36,
);


%alpha = (

0=>A,
1=>B,
2=>C,
3=>D,
4=>E,
5=>F,
6=>G,
7=>H,
8=>I,
9=>J,
10=>K,
11=>L,
12=>M,
13=>N,
14=>O,
15=>P,
16=>Q,
17=>R,
18=>S,
19=>T,
20=>U,
21=>V,
22=>W,
23=>X,
24=>Y,
25=>Z,
26=> '0',
27=> '1',
28=> '2',
29=> '3',
30=> 4,
31=> 5,
32=> 6,
33=> 7,
34=> 8,
35=> 9,
36 =>' ',
);

if (scalar @ARGV == 0){
          print "no se introducieron datos\n";
          print "usage: ./cifrado.pl <'cadena'> <llave> <-c/-d> <alfabeto>\n";
          print "ejemplo: ./cifrado.pl 'h3ll0 world' 3 -c -letters\n\n";
 } 

elsif(scalar @ARGV > 4 ){
	print "demasiados argumentos\n";
	print "usage: ./cifrado.pl <'cadena'> <llave> <-c/-d> <alfabeto>\n";
        print "ejemplo: ./cifrado.pl 'h3ll0 world' 3 -c -letters\n\n";


}

else{ #els para validar argumentos
	#si es archivo
	if(-f $cadena){
    
		  switch ($accion){
         case "-c"
            {   encryptFile();
		print "\n";
	     }
         case "-d"
            {   decryptFile();
		print"\n";
	    }
         else
              { print "la acción introducida  no es válida. Ingrese -c para cifrar o -d para descifrar\n";
		print "asegúrese de ingresar desplazamiento y archivo o string para cifrar o descifrar\n";
		print "ejemplo: ./cifrado.pl 'hello world' 3 -c\n\n";
	       }
        }#fin switch

     }#fin if si es archivo	
	#si es cadena
	
	else{
  	$cadena = uc $cadena;
	@letras = split(//, $cadena);
	
	switch ($accion){
	 case "-c"
             {   cifrar() }
	 case "-d"
             {  descifrar() }
	 else
	      	{ print "la acción introducida  no es válida. Ingrese -c para cifrar o -d para descifrar\n";
                print "asegúrese de ingresar desplazamiento y archivo o string para cifrar o descifrar\n";
		print "ejemplo: ./cifrado.pl 'hello world' 3 -c\n\n"; 
              }

	}#fin switch
    	 }
}

sub cifrar{
	
  switch($uni){

	case "-letters" 
	{
                foreach $a (@letras)
                {

                 if ( $a =~ /^[A-Z]+$/)
                 {
			
                     $cifrado = (($alfabeto{$a} + $corrimiento) % 26);
                     $cesar = $alpha{$cifrado};
                     print "$cesar";
                 }
                 elsif( $a=~ /^[0-9]+$/ || $a eq ' ' )
                 {
                       print $a;
                 }
		 
                }
        print "\n";
	}


	case "-numbers"
	{
                foreach $a (@letras)
                {

                 if ( $a =~ /^[A-Z]+$/ || $a eq ' ' )
                 {
			print $a;
                    
                 }
                 elsif( $a=~ /^[0-9]+$/)
                 {
                      $cifrado = (($numeros{$a} + $corrimiento) % 10);
                     $cesar = $numbers{$cifrado};
                     print "$cesar";  
                 }
		
                }
        print "\n";
	}

case "-alphanumeric" 
	{
                foreach $a (@letras)
                {

                 if ( $a eq ' ')
                 {
			
                     print $a;
                 }
                 else
                 {
                      $cifrado = (($alfabeto{$a} + $corrimiento) % 36);
                     $cesar = $alpha{$cifrado};
                     print "$cesar";
                 }
		 
                }
        print "\n";
	}

  }#switch     
}#fin subrutina cifrar


######### descrifrar cadenas ########


sub descifrar{
	
  switch($uni){

	case "-letters" 
	{
                foreach $a (@letras)
                {

                 if ( $a =~ /^[A-Z]+$/)
                 {
			
                     $cifrado = (($alfabeto{$a} - $corrimiento) % 26);
                     $cesar = $alpha{$cifrado};
                     print "$cesar";
                 }
                 elsif( $a=~ /^[0-9]+$/ || $a eq ' ')
                 {
                       print $a;
                 }
		 
                }
        print "\n";
	}


	case "-numbers"
	{
                foreach $a (@letras)
                {

                 if ( $a =~ /^[A-Z]+$/ || $a eq ' ')
                 {
			print $a;
                    
                 }
                 elsif( $a=~ /^[0-9]+$/)
                 {
                      $cifrado = (($numeros{$a} - $corrimiento) % 10);
                     $cesar = $numbers{$cifrado};
                     print "$cesar";  
                 }
		
                }
        print "\n";
	}


case "-alphanumeric" 
	{
                foreach $a (@letras)
                {

                 if ($a eq ' ')
                 {
			print $a;
                     
                 }
                 else
                 {
                       $cifrado = (($alfabeto{$a} - $corrimiento) % 36);
                     $cesar = $alpha{$cifrado};
                     print "$cesar";
                 }
		 
                }
        print "\n";
	}  


  }#switch     
}#fin subrutina descifrar

#### archivos


sub encryptFile{

 switch($uni){

	case "-letters" 
	{

		open(FH,'<', $cadena)
         or die "no se pudo abrir el archivo $cadena";

          while(<FH>){
               $str= uc $_;
		chomp($str);
               @words = split(//,$str);
                   
		foreach $a (@words){
			
		if ( $a =~ /^[A-Z]+$/)
                 {
		$cifrado = ($alfabeto{$a}+$corrimiento) %  26;
	        $cesar = $alpha{$cifrado};
		print "$cesar";
    
                 }
		elsif( $a=~ /^[0-9]+$/ || $a eq ' ')
                 {
                       print $a;
                 }
        	
             	}#fin foreach
       	    
		print"\n";
	  }#fin while
             close(FH); 
		 
        }
       
	case "-numbers" 
	{

		open(FH,'<', $cadena)
         or die "no se pudo abrir el archivo $cadena";

          while(<FH>){
               $str= uc $_;
		chomp($str);
               @words = split(//,$str);
                   
		foreach $a (@words){
			
		if ( $a =~ /^[A-Z]+$/ || $a eq ' ')
                 {
		print $a;
                 }
		elsif( $a=~ /^[0-9]+$/)
                 {
                       
		$cifrado = ($numeros{$a}+$corrimiento) %  10;
	        $cesar = $numbers{$cifrado};
		print "$cesar";
                 }
        	
             	}#fin foreach
       	    
		print"\n";
	  }#fin while
             close(FH); 
		 
        }	


	case "-alphanumeric" 
	{

		open(FH,'<', $cadena)
         or die "no se pudo abrir el archivo $cadena";

          while(<FH>){
               $str= uc $_;
		chomp($str);
               @words = split(//,$str);
                   
		foreach $a (@words){
			
		if ($a eq ' ')
                 {
			 print $a;
		
                 }
		else
                 {
                      $cifrado = ($alfabeto{$a}+$corrimiento) %  36;
	        	$cesar = $alpha{$cifrado};
			print "$cesar";
    
                 }
        	
             	}#fin foreach
       	    
		print"\n";
	  }#fin while
             close(FH); 
		 
        }
       

 
	}#switch
}#fin encryptFile




sub decryptFile{

 switch($uni){

	case "-letters" 
	{

		open(FH,'<', $cadena)
         or die "no se pudo abrir el archivo $cadena";

          while(<FH>){
               $str= uc $_;
		chomp($str);
               @words = split(//,$str);
                   
		foreach $a (@words){
			
		if ( $a =~ /^[A-Z]+$/)
                 {
		$cifrado = ($alfabeto{$a}-$corrimiento) %  26;
	        $cesar = $alpha{$cifrado};
		print "$cesar";
    
                 }
		elsif( $a=~ /^[0-9]+$/ || $a eq ' ')
                 {
                       print $a;
                 }
        	
             	}#fin foreach
       	    
		print"\n";
	  }#fin while
             close(FH); 
		 
        }
       
	case "-numbers" 
	{

		open(FH,'<', $cadena)
         or die "no se pudo abrir el archivo $cadena";

          while(<FH>){
               $str= uc $_;
		chomp($str);
               @words = split(//,$str);
                   
		foreach $a (@words){
			
		if ( $a =~ /^[A-Z]+$/ || $a eq ' ')
                 {
		print $a;
                 }
		elsif( $a=~ /^[0-9]+$/)
                 {
                       
		$cifrado = ($alfabeto{$a}-$corrimiento) %  10;
	        $cesar = $alpha{$cifrado};
		print "$cesar";
                 }
        	
             	}#fin foreach
       	    
		print"\n";
	  }#fin while
             close(FH); 
		 
        }	


	case "-alphanumeric" 
	{

		open(FH,'<', $cadena)
         or die "no se pudo abrir el archivo $cadena";

          while(<FH>){
               $str= uc $_;
		chomp($str);
               @words = split(//,$str);
                   
		foreach $a (@words){
			
		if ( $a eq ' ')
                 {
		print $a;
                 }
		else
		{
                       
		$cifrado = ($alfabeto{$a}-$corrimiento) %  36;
	        $cesar = $alpha{$cifrado};
		print "$cesar";
                 }
        	
             	}#fin foreach
       	    
		print"\n";
	  }#fin while
             close(FH); 
		 
        }	

	}#switch
}#fin decryptFile

















