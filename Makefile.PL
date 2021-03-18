sub END{

use ExtUtils::MakeMaker;

WriteMakefile(
   NAME => 'RTE::Dump',
   LICENSE => 'BSD2',
   AUTHOR => 'Edoardo Mantovani aka Baseband',
   DEFINE => '',
   VERSION_FROM => 'lib/RTE/Dump.pm',
   LIBS => ['-L/lib -L/usr/lib -L/usr/local/lib '],
   INC => '-I/include -I/usr/include ',
   PREREQ_PM => {
  },
);


}
