use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'AA::Altsteps',
    VERSION_FROM => 'lib/AA/Altsteps.pm', # finds $VERSION
    PREREQ_PM    => {
        'JSON' => 0,
        'File::Spec' => 0,
    },
    ABSTRACT     => 'Access alternative 12-step programs',
    AUTHOR       => 'Secretary Harry <fuckgoogle@example.com>',
);
