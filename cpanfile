requires 'perl', 'v5.10.1';

on build => sub {
    requires 'Module::Build', '0.3601';
};

on configure => sub {
    requires 'Module::Build', '0.3601';
};

on test => sub {
    requires 'Test::More', '>=0.88';
    requires 'Test::Exception', '>=0.32';
};

requires 'Catmandu';
requires 'Moo', '>=1.004';
requires 'Furl', '>=3.02';
requires 'Catmandu::Importer::XML';
requires 'Try::Tiny', '>=0.12';
