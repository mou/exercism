package Luhn;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid ($number) {
    $number =~ s/ //g;

    if(length $number <= 1) {
        return 0;
    }
    if ($number =~ m/[^0-9]/) {
        return 0;       
    }

    my $sum = 0;

    for (my $i = (length $number) - 1; $i >= 0; $i--) {
        my $num = int(substr($number, $i, 1));
        
        if((((length $number) - 1) - $i) % 2 == 1) {
            $num *= 2;
            if($num > 9) {
                $num -= 9;
            }
        }          
        
        $sum += $num;        
    }

    return $sum % 10 == 0;
}

