use utf8; use strict; use warnings;
sub lees { local $/; open my $f,'<:encoding(UTF-8)',$_[0] or die "$_[0]: $!"; my $s=<$f>; close $f; $s }
my $html = lees('index.html');
sub rep { my ($oud,$nieuw)=@_; my $i=index($html,$oud); die "niet gevonden: ".substr($oud,0,70)."\n" if $i<0;
  substr($html,$i,length($oud)) = $nieuw; }

rep('            <!-- Het dashboard draagt geen titel: de periode links en de
                 eerstvolgende uitbetaling rechts zeggen meer dan het woord
                 "Dashboard" boven het scherm waar je toch al staat. app.js §2
                 verbergt de titel op deze pagina, §10 vult de keuzelijst met
                 de maanden waar cijfers voor zijn. -->
            <div class="page-head__tools page-head__tools--breed" data-tools="dashboard" hidden>
              <label class="sr-only" for="dash-range">Period</label>
              <select class="input" id="dash-range"></select>
              <p class="payout">Next payout <b>&euro; 2.030</b></p>
            </div>',
'            <!-- Het dashboard draagt geen titel: alleen de periode, want die
                 zegt meer dan het woord "Dashboard" boven het scherm waar je
                 toch al staat. app.js §2 verbergt de titel op deze pagina,
                 §10 vult de keuzelijst met de maanden waar cijfers voor zijn. -->
            <div class="page-head__tools page-head__tools--breed" data-tools="dashboard" hidden>
              <label class="sr-only" for="dash-range">Period</label>
              <select class="input" id="dash-range"></select>
            </div>');

$html =~ s/\Qhref="styles.css?v=15"\E/href="styles.css?v=16"/ or die "css-versie\n";
$html =~ s/\Qsrc="app.js?v=15"\E/src="app.js?v=16"/ or die "js-versie\n";
open my $h,'>:encoding(UTF-8)','index.html' or die $!; print $h $html; close $h;

# De opmaak van die knop is nu nergens meer voor nodig.
my $css = lees('styles.css');
my $oud = '/* Eerstvolgende uitbetaling: leest als een knop, maar valt niets te bedienen,
   dus het blijft tekst in een omlijning. */
.payout {
  margin-left: auto;
  padding: 0 14px;
  height: 36px;
  display: inline-flex; align-items: center; gap: 6px;
  border: 1px solid var(--border); border-radius: var(--r-full);
  background: var(--bg-surface);
  font-size: var(--fs-sm); color: var(--text-muted);
  white-space: nowrap;
}
.payout b { font-weight: 600; color: var(--text-strong); font-variant-numeric: tabular-nums; }

';
my $i = index($css,$oud); die "payout-css niet gevonden\n" if $i<0;
substr($css,$i,length($oud)) = '';
$css =~ s/\Q  .payout { margin-left: auto; }\n\E// or die "mobiele payout-regel niet gevonden\n";
open my $o,'>:encoding(UTF-8)','styles.css' or die $!; print $o $css; close $o;
print "klaar\n";
