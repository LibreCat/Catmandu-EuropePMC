use strict;
use warnings;
use Test::More;

my $pkg;
BEGIN {
    $pkg = 'Catmandu::Importer::EuropePMC';
    use_ok $pkg;
}

require_ok $pkg;

my $importer = $pkg->new(query => '10779411');

isa_ok($importer, $pkg);

can_ok($importer, 'each');

my $rec = $importer->first->{resultList}->{result};

ok ($rec->{title} =~ /^Structural basis/, "title ok");
ok ($rec->{pmid} eq '10779411', "pmid ok");

my $db_importer = $pkg->new(
		query => '10779411', 
		module => 'databaseLinks',
		db => 'uniprot',
		page => '1',
		);

my $db = $db_importer->first;

is(exists $db->{dbCrossReferenceList}->{dbCrossReference}, '1', "Database links ok");

my $db_importer2 = $pkg->new(
	query => '23280342', 
	module => 'databaseLinks',
	db => 'uniprot',
	page => '1',
	);

my $db2 = $db_importer2->first;
is(exists $db2->{dbCrossReferenceList}->{dbCrossReference}, '1', "More Database links ok");

done_testing 8;
