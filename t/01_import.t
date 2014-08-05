use strict;
use warnings FATAL => 'all';
use Test::More;
use Test::Exception;
use YAML;

my $pkg;
BEGIN {
    $pkg = 'Catmandu::Importer::EuropePMC';
    use_ok $pkg;
}

# search
my $rec = $pkg->new(query => '10779411')->first;

like($rec->{title}, qr/^Structural basis/, "title ok");
is($rec->{pmid}, '10779411', "pmid ok");

# databaseLinks
my $db_imp = $pkg->new(
    pmid => '10779411',
    module => 'databaseLinks',
    db => 'uniprot',
    page => '1',
    );

is($db_imp->first->{dbName}, "UNIPROT", "Database links ok");

# citations
my $citation = $pkg->new(
    pmid => '10779411',
    module => 'citations',
    );

ok ($citation->count > 10, "Some citations fetched");

# references
my $reference = $pkg->new(
    pmid => '10592235',
    module => 'references',
    );

ok ($reference->count > 10, "Some references fetched");

done_testing;
