%macro utl_pdf2txt(pdf);

%utl_submit_r64x("
library('tm');
library('pdftools');
file <- 'D:/wps/doc/en/&pdf..pdf';
Rpdf <- readPDF(control = list(text = '-layout'));
corpus <- VCorpus(URISource(file),
      readerControl = list(reader = Rpdf));
want <- content(content(corpus)[[1]]);
write(want,file='D:/txt/&pdf..txt');
");
%mend utl_pdf2txt;

%utl_pdf2txt(WPS-Communicate-User-Guide-and-Reference-Syntax-Diagram-enx);
%utl_pdf2txt(WPS-Migration-Guide-for-zOS-enx);
%utl_pdf2txt(WPS-Server-Explorer-User-Guide-and-Reference-enx
%utl_pdf2txt(WPS-Workbench-User-Guide-enx);
%utl_pdf2txt(WPS-Communicate-User-Guide-and-Reference-en);
%utl_pdf2txt(WPS-Communicate-User-Guide-and-Reference-en);
%utl_pdf2txt(WPS-Configuration-for-Hadoop-en);
%utl_pdf2txt(WPS-kernel-for-Jupyter-installation-guide-en);
%utl_pdf2txt(WPS-Link-User-Guide-and-Reference-en);
%utl_pdf2txt(WPS-Matrix-Programming-User-Guide-en);
%utl_pdf2txt(WPS-New-in-Release-en);
%utl_pdf2txt(WPS-Proc-R-User-Guide-en);
%utl_pdf2txt(WPS-Python-Procedure-User-Guide-en);
%utl_pdf2txt(WPS-Reference-for-Language-Elements-en);
%utl_pdf2txt(WPS-Web-User-Guide-en);
%utl_pdf2txt(WPS-Workbench-User-Guide-en
);

filename inp (
"D:/txt/WPS-Communicate-User-Guide-and-Reference-en.txt"
"D:/txt/WPS-Communicate-User-Guide-and-Reference-en.txt"
"D:/txt/WPS-Configuration-for-Hadoop-en.txt"
"D:/txt/WPS-kernel-for-Jupyter-installation-guide-en.txt"
"D:/txt/WPS-Link-User-Guide-and-Reference-en.txt"
"D:/txt/WPS-Matrix-Programming-User-Guide-en.txt"
"D:/txt/WPS-New-in-Release-en.txt"
"D:/txt/WPS-Proc-R-User-Guide-en.txt"
"D:/txt/WPS-Python-Procedure-User-Guide-en.txt"
"D:/txt/WPS-Reference-for-Language-Elements-en.txt"
"D:/txt/WPS-Web-User-Guide-en.txt"
"D:/txt/WPS-Workbench-User-Guide-en.txt"
"D:/txt/WPS-Communicate-User-Guide-and-Reference-Syntax-Diagram-enx.txt"
"D:/txt/WPS-Migration-Guide-for-zOS-enx.txt"
"D:/txt/WPS-Server-Explorer-User-Guide-and-Reference-enx.txt"
"D:/txt/WPS-Workbench-User-Guide-enx.txt"
);

libname wps "d:/wps";

data wps.wpsdoc(compress=char);

  infile inp;
  file "d:/wps/doc.txt";

  input;
   _infile_=compress(_infile_,'0A'x);
   _infile_=compress(_infile_,'0C'x);
   _infile_=compress(_infile_,'0D'x);
   _infile_=compress(_infile_,'00'x);
   _infile_=compress(_infile_,'09'x);
   _infile_=compress(_infile_,'—');

  lyn=compbl(strip(_infile_));

  if length(lyn)>4;
  put lyn;

run;quit;
