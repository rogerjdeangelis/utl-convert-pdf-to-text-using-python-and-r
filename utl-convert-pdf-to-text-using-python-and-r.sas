Convert pdf to text using python and r

  https://tinyurl.com/yckpezjx
  https://github.com/rogerjdeangelis/utl-convert-pdf-to-text-using-python-and-r

    1. r pdftools
    2. python pdfbox  (you need to install java workd better then:?


       PyPDF2
       Tabula-py
       Slate
       PDFQuery
       xpdf
       pdfminer

       Install Java

        https://jdk.java.net/archive/

       - Download from https://jdk.java.net/archive/
       - Extract a files of jdk-11.0.2 into C:\tools\Java\
       - Results should be like C:\tools\Java\jdk-11.0.2
       - Add C:\tools\Java\jdk-11.0.2\bin into env "path"
       - refrest path. Open a command window and type "set PATH=c"
       - open a new command  cmd and type "java -version"

       You should see this

       C:\Windows\system32>java -version
       java version "1.8.0_251"
       Java(TM) SE Runtime Environment (build 1.8.0_251-b08)
       Java HotSpot(TM) 64-Bit Server VM (build 25.251-b08, mixed mode)


/*                   _                     _                    _  __
(_)_ __  _ __  _   _| |_   _ __ ___   __ _| | _____   _ __   __| |/ _|
| | `_ \| `_ \| | | | __| | `_ ` _ \ / _` | |/ / _ \ | `_ \ / _` | |_
| | | | | |_) | |_| | |_  | | | | | | (_| |   <  __/ | |_) | (_| |  _|
|_|_| |_| .__/ \__,_|\__| |_| |_| |_|\__,_|_|\_\___| | .__/ \__,_|_|
        |_|                                          |_|
*/

You needs before executing

  d:/pdf/class.pdf
  d:/txt

ods escapechar="^";
ods pdf file="d:/pdf/class.pdf" style=minimal ;
proc report data=sashelp.class(obs=5) box;
  title1 " Title 1";
  title2 " Title 2";
  footnote1 "[1] Title 1    This is a test of footnote1";
  footnote2 "[2] Title 2    This is a test of footnote2";
cols ("This is spanning ^{NEWLINE}" _all_ );
define sex / display width=5;
run;quit;
ods pdf text="^{NEWLINE}^S={font_size=8pt just=l} Bottom of boxed report";
run;quit;
ods pdf close;
title;
footnote;

/**************************************************************************************************************************/
/*                                                                                                                        */
/* File: d:/pdf/class.pdf                                                                                                 */
/*                                                                                                                        */
/* Title 1                                                                                                                */
/* Title 2                                                                                                                */
/*                                                                                                                        */
/*  --------------------------------------------------                                                                    */
/*  |          This is spanning ^{NEWLINE}           |                                                                    */
/*  |NAME      SEX          AGE     HEIGHT     WEIGHT|                                                                    */
/*  |------------------------------------------------|                                                                    */
/*  |Alfred  | M    |        14|        69|     112.5|                                                                    */
/*  |--------+------+----------+----------+----------|                                                                    */
/*  |Alice   | F    |        13|      56.5|        84|                                                                    */
/*  |--------+------+----------+----------+----------|                                                                    */
/*  |Barbara | F    |        13|      65.3|        98|                                                                    */
/*  |--------+------+----------+----------+----------|                                                                    */
/*  |Carol   | F    |        14|      62.8|     102.5|                                                                    */
/*  |--------+------+----------+----------+----------|                                                                    */
/*  |Henry   | M    |        14|      63.5|     102.5|                                                                    */
/*  --------------------------------------------------                                                                    */
/*                                                                                                                        */
/* [1] Title 1    This is a test of footnote1                                                                             */
/* [2] Title 2    This is a test of footnote2                                                                             */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*          _                         _  __ _              _
/ |  _ __  | |_ _ __ ___    _ __   __| |/ _| |_ ___   ___ | |___
| | | `__| | __| `_ ` _ \  | `_ \ / _` | |_| __/ _ \ / _ \| / __|
| | | |    | |_| | | | | | | |_) | (_| |  _| || (_) | (_) | \__ \
|_| |_|     \__|_| |_| |_| | .__/ \__,_|_|  \__\___/ \___/|_|___/
                           |_|
*/

%utlfkil(d:/txt/class.txt);

%let _inpPdf=d:/pdf/class;
%let _outTxt=d:/txt/class;

%utlfkil(d:/txt/class.txt);

/*- convert pdf to text with annotations --*/
%utl_submit_r64("
library('tm');
library('pdftools');
file <- '&_inpPdf..pdf';
Rpdf <- readPDF(control = list(text = '-layout'));
corpus <- VCorpus(URISource(file),
      readerControl = list(reader = Rpdf));
want <- content(content(corpus)[[1]]);
want;
write(want,file='&_outTxt..txt');
");

/*                  _               _
 _ __    ___  _   _| |_ _ __  _   _| |_
| `__|  / _ \| | | | __| `_ \| | | | __|
| |    | (_) | |_| | |_| |_) | |_| | |_
|_|     \___/ \__,_|\__| .__/ \__,_|\__|
                       |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/* File: d:/txt/class.txt                                                                                                 */
/*                                                                                                                        */
/*  Title 1                                                                                                               */
/*  Title 2                                                                                                               */
/*                                                                                                                        */
/*            This is spanning                                                                                            */
/*    NAME     SEX AGE HEIGHT WEIGHT                                                                                      */
/*  Alfred     M    14      69   112.5                                                                                    */
/*  Alice      F    13    56.5      84                                                                                    */
/*  Barbara F       13    65.3      98                                                                                    */
/*  Carol      F    14    62.8   102.5                                                                                    */
/*  Henry      M    14    63.5   102.5                                                                                    */
/*                                                                                                                        */
/*                                                                                                                        */
/*   Bottom of boxed report                                                                                               */
/*                                                                                                                        */
/*                                                                                                                        */
/*  [1] Title 1     This is a test of footnote1                                                                           */
/*  [2] Title 2     This is a test of footnote2                                                                           */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___                _   _                     _                              _  __ _
|___ \   _ __  _   _| |_| |__   ___  _ __     (_) __ ___   ____ _   _ __   __| |/ _| |__   _____  __
  __) | | `_ \| | | | __| `_ \ / _ \| `_ \    | |/ _` \ \ / / _` | | `_ \ / _` | |_| `_ \ / _ \ \/ /
 / __/  | |_) | |_| | |_| | | | (_) | | | |   | | (_| |\ V / (_| | | |_) | (_| |  _| |_) | (_) >  <
|_____| | .__/ \__, |\__|_| |_|\___/|_| |_|  _/ |\__,_| \_/ \__,_| | .__/ \__,_|_| |_.__/ \___/_/\_\
        |_|    |___/                        |__/                   |_|

*/


Note this implementation outputs a file with the same name but with extension "txt" ;
Does not output lines in order?

%utlfkil(d:/pdf/class.txt);

%utl_submit_py64_310x('
import pdfbox;
p = pdfbox.PDFBox();
print(p);
p.extract_text("d:/pdf/class.pdf");
');

/*           _   _                               _               _
 _ __  _   _| |_| |__   ___  _ __     ___  _   _| |_ _ __  _   _| |_
| `_ \| | | | __| `_ \ / _ \| `_ \   / _ \| | | | __| `_ \| | | | __|
| |_) | |_| | |_| | | | (_) | | | | | (_) | |_| | |_| |_) | |_| | |_
| .__/ \__, |\__|_| |_|\___/|_| |_|  \___/ \__,_|\__| .__/ \__,_|\__|
|_|    |___/                                        |_|
*/


/**************************************************************************************************************************/
/*                                                                                                                        */
/*                                                                                                                        */
/* [2] Title 2    This is a test of footnote2                                                                             */
/* [1] Title 1    This is a test of footnote1                                                                             */
/* Title 1                                                                                                                */
/* Title 2                                                                                                                */
/* This is spanning                                                                                                       */
/* NAME SEX AGE HEIGHT WEIGHT                                                                                             */
/* Alfred M 14 69 112.5                                                                                                   */
/* Alice F 13 56.5 84                                                                                                     */
/* Barbara F 13 65.3 98                                                                                                   */
/* Carol F 14 62.8 102.5                                                                                                  */
/* Henry M 14 63.5 102.5                                                                                                  */
/* Bottom of boxed report                                                                                                 */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*        _       _           _
 _ __ ___| | __ _| |_ ___  __| |  _ __   ___ _ __   ___  ___
| `__/ _ \ |/ _` | __/ _ \/ _` | | `_ \ / _ \ `_ \ / _ \/ __|
| | |  __/ | (_| | ||  __/ (_| | | |_) |  __/ |_) | (_) \__ \
|_|  \___|_|\__,_|\__\___|\__,_| | .__/ \___| .__/ \___/|___/
                                 |_|        |_|
*/

https://github.com/rogerjdeangelis/utl-create-a-simple-n-percent-clinical-table-in-r-sas-wps-python-output-pdf-rtf-xlsx-html-list
https://github.com/rogerjdeangelis/utl-creating-identical-pdf-and-powerpoint-slides
https://github.com/rogerjdeangelis/utl-identical-side-by-side-text-and-graphics-in-pdf-and-powerpoint
https://github.com/rogerjdeangelis/utl-overlaying-histograms-and-scatterplots-in-powerpoint-pdf-and-jpeg
https://github.com/rogerjdeangelis/utl-putting-a-frame-around-text-in-doc-rtf-and-pdf-ods-destinations-with-and-without-layout
https://github.com/rogerjdeangelis/utl-removing-unwanted-bookmarks-in-pdf-table-of-contents-toc
https://github.com/rogerjdeangelis/utl-scraping-pdf-output-for-pdf-tables-and-lists
https://github.com/rogerjdeangelis/utl-side-by-side-proc-report-output-in-pdf-html-and-excel
https://github.com/rogerjdeangelis/utl_combine_pdf_files_and_delete_pages_from_a_pdf_pyPDF_ghostscript
https://github.com/rogerjdeangelis/utl_combining_all_pdf_files_in_a_directory
https://github.com/rogerjdeangelis/utl_convert_pdf_tables_to_SAS_WPS_datasets
https://github.com/rogerjdeangelis/utl_convert_pdf_tables_to_sas_tables
https://github.com/rogerjdeangelis/utl_dropping-down-to-R-and-converting-pdfs-to-sas-tables-and-text
https://github.com/rogerjdeangelis/utl_dropping-down-to-powershell-and-converting-doc-and-rtf-files-to-pdfs
https://github.com/rogerjdeangelis/utl_ods_pdf_and_rtf_two_different_page_titles_on_the_same_page
https://github.com/rogerjdeangelis/utl_pdf_graphics_top_40_a_sas_ods_graphics_look_at_chicago_public_schools_salaries_by_job
https://github.com/rogerjdeangelis/utl_report_does_not_show_group_variable_across_new_pages_in_rtf_and_pdf


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
