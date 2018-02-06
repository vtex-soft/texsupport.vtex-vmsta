%%
%% This is file `vmsta.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% vmsta.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright 2014 by VTEX UAB
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
%% Last update: 2014/09/11
%%
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{vmsta}[2014/09/11 v1.0 VMSTA Journal class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*

\LoadClass{article}
\RequirePackage{etoolbox}
\RequirePackage{fixltx2e}
\InputIfFileExists{vmsta.cfg}{}{}


\def\@journal{Modern Stochastics: Theory and Applications}
\def\@journal@url{http://www.i-journals.org/vmsta}
\def\@JOURNAL{MODERN STOCHASTICS: THEORY AND APPLICATIONS}
\def\@jid{vmsta}
\def\@JID{VMSTA}

\def\@issn@print{1234-9874}
\def\@issn@online{1234-9875}
\def\print@issn@print{ISSN:\space \@issn@print\space (print)}
\def\print@issn@online{ISSN:\space \@issn@print\space (online)}

\def\print@doi{DOI:\space\href{http://dx.doi.org/\@doi}{\@doi}}
\def\@ppages{\@firstpage--\@lastpage}
\def\print@volume{\@journal\space\@volume\space (\@pubyear) \@ppages}

\csdef{@volume}{0}
\csdef{@pubyear}{0000}
\csdef{@@ppages}{\empty}
\csdef{@firstpage}{0}
\csdef{@lastpage}{0}
\csdef{@doi}{\empty}


\def\volume#1{\gdef\@volume{#1}}
\def\pubyear#1{\gdef\@pubyear{#1}}
\def\firstpage#1{\gdef\@firstpage{#1}\setcounter{page}{#1}}
\def\lastpage#1{\gdef\@lastpage{#1}}
\def\doi#1{\gdef\@doi{#1}}

\def\logo@vtex{vmsta-logo-vtex}
\def\includevtexlogo{\null}

\def\cclicense@link{http://creativecommons.org/licenses/by/4.0/}
\def\@openaccess{Open access article under the \href{\cclicense@link}{CC BY} license.}
\def\@copyright{\lower5pc\hbox{\parbox{\textwidth}{\color[gray]{.7}\texttt{Preprint submitted to VTeX / Modern Stochastics: Theory and Applications\linebreak<\today>}}}}
\def\copyright@line{\@copyright@fmt{\@copyright}}
\def\@copyright@fmt#1{\vbox to0pt{\vskip-4.6pc\noindent\hbox{\footnotesize #1\hfill}\vss}}
\def\nocopyrightline{\gdef\copyright@line{\@empty}}
\def\credit@line{\@credit@fmt{\@credit}}
\def\@credit@fmt#1{#1}
\def\@credit{\vbox to 0pt{\vskip-1.85pc\hskip-\textwidth\noindent\hbox to \textwidth{\footnotesize \href{\@journal@url}{www.i-journals.org/vmsta}\hfill\includevtexlogo}}}

\let\@received\@empty
\let\@revised\@empty
\let\@accepted\@empty
\let\@publishedonline\@empty
\def\received#1{\gdef\@received{{Received:~\hbox{#1}}}}
\def\revised#1{\gdef\@revised{{Revised:~\hbox{#1}}}}
\def\accepted#1{\gdef\@accepted{{Accepted:~\hbox{#1}}}}
\def\publishedonline#1{\gdef\@publishedonline{{\hbox{Published~online:}~\hbox{#1}}}}
\def\print@history{%
  \def\sep{\def\sep{, \allowbreak}}%
  \ifx\@received\@empty\else\sep\@received\fi%
  \ifx\@revised\@empty\else\sep\@revised\fi%
  \ifx\@accepted\@empty\else\sep\@accepted\fi%
  \ifx\@publishedonline\@empty\else\sep\@publishedonline\fi%
}


\RequirePackage{amsmath}
\def\th@remark{%
  \let\@upn\relax
  \thm@headfont{\itshape}%
  \normalfont % body font
  \thm@preskip\topsep \divide\thm@preskip\tw@
  \thm@postskip\thm@preskip
}

\RequirePackage{amssymb}

\AtEndOfClass{\usepackage{amsthm}}
\AtBeginDocument{%
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
}

\usepackage[T1]{fontenc}
\usepackage{textcomp}

\RequirePackage{geometry}
\geometry{%
  twoside,
  paperwidth=6.125in,
  paperheight=9.25in,
  textheight=195mm,
  textwidth=119mm,
  centering,
  headheight=50pt,
  headsep=12pt,
  footskip=12pt,
  footnotesep=24pt plus 2pt minus 1pt
}

\RequirePackage{rotating}
\RequirePackage{graphicx}

%% frontmatter

\newlength\printhistorymargin
\setlength\printhistorymargin{0pc}
\newenvironment{printhistory}
 {\list{}{\rightmargin\printhistorymargin\leftmargin\printhistorymargin}\item\relax\centering}
 {\par\endlist}

\newif\iflongmktitle \longmktitlefalse

\let\comma\@empty
\let\tnotesep\@empty
\def\title#1{\gdef\@title{#1}}
\let\@title\@empty

\def\@@@Label#1{\@bsphack\protected@write\@auxout{}%
         {\string\Newlabel{#1}{\@currentlabel}}\@esphack}
\def\Newlabel#1#2{\expandafter\xdef\csname X@#1\endcsname{#2}}

\def\@@@Ref#1{\@ifundefined{X@#1}{0}{\csname X@#1\endcsname}%
}

\def\tnotemark[#1]{\textsuperscript{\@for\@@tmark:=#1\do{%
      \edef\tnotenum{\@ifundefined{X@\@@tmark}{1}{\@@@Ref{\@@tmark}}}%
      \ifcase\tnotenum\or\ding{73}\or,\ding{73}\ding{73}\fi}}%
}
\let\@tnotemark\@empty

\let\@tnotes\@empty
\RequirePackage{pifont}
\newcounter{tnote}
\def\tnotetext[#1]#2{\g@addto@macro\@tnotes{%
  \refstepcounter{tnote}\@@@Label{#1}%
   \def\thefootnote{\ifcase\c@tnote\or\ding{73}\or\ding{73}\ding{73}\fi}%
    \footnotetext{#2}}}

\let\@nonumnotes\@empty
\def\nonumnote#1{\g@addto@macro\@nonumnotes{%
     \let\thefootnote\relax\footnotetext{#1}}}

\newcounter{fnote}
\def\fnmark[#1]{\let\comma\@empty
    \def\@fnmark{\@for\@@fnmark:=#1\do{%
    \edef\fnotenum{\@ifundefined{X@\@@fnmark}{1}{\@@@Ref{\@@fnmark}}}%
  \unskip\comma\fnotenum\let\comma,}}%
}

\let\@fnotes\@empty\let\@fnmark\@empty
\def\fntext[#1]#2{\g@addto@macro\@fnotes{%
     \refstepcounter{fnote}\@@@Label{#1}%
   \def\thefootnote{\thefnote}%
   \global\setcounter{footnote}{\thefnote}%
   \footnotetext{#2}}}

\def\cormark[#1]{\edef\cnotenum{\@@@Ref{#1}}%
    \unskip\textsuperscript{\sep\ifcase\cnotenum\or
       $\ast$\or$\ast\ast$\fi\hspace{-1pt}}\let\sep=,}

\let\@cormark\@empty
\let\@cornotes\@empty
\newcounter{cnote}
\def\cortext[#1]#2{\g@addto@macro\@cornotes{%
    \refstepcounter{cnote}\@@@Label{#1}%
    \def\thefootnote{\ifcase\thecnote\or$\ast$\or
    $\ast\ast$\fi}%
    \footnotetext{#2}}}

\let\@corref\@empty
\def\corref#1{%
 \edef\cnotenum{\@@@Ref{#1}}%
 \edef\@corref{\ifcase\cnotenum\or
    $\ast$\or$\ast\ast$\fi\hskip-1pt}%
 }

\def\fnref#1{\fnmark[#1]}
\def\tnoteref#1{\tnotemark[#1]}

\def\resetTitleCounters{\c@cnote=0
   \c@fnote=0 \c@tnote=0 \c@footnote=0}

\let\eadsep\@empty
\let\@@@@eads\@empty
\let\@@@@uads\@empty
\let\@cormark\@empty
\def\hashchar{\expandafter\@gobble\string\~}
\def\underscorechar{\expandafter\@gobble\string\_}
\def\lbracechar{\expandafter\@gobble\string\{}
\def\rbracechar{\expandafter\@gobble\string\}}

\def\email{\@ifnextchar[{\@uemail}{\@email}}
\gdef\@email#1{\bgroup\def\_{\string\underscorechar\space}%
  \def\{{\string\lbracechar\space}%
   \def~{\hashchar\space}%
   \def\}{\string\rbracechar\space}%
   \edef\tmp{\the\@eadauthor}
   \immediate\write\@auxout{\string\emailauthor
     {#1}{\expandafter\strip@prefix\meaning\tmp}}%
  \egroup
}
\newcounter{ead}
\gdef\emailauthor#1#2{\stepcounter{ead}%
     \g@addto@macro\@@@@eads{%
      \eadsep{\href{mailto:#1}{#1}}~(\name@m@ead{#2})\def\eadsep{\unskip,\allowbreak \space}}%
}
\gdef\@uead[#1]#2{\bgroup
  \def~{\string\hashchar\space}%
  \def\_{\string\underscorechar\space}%
   \edef\tmp{\the\@eadauthor}
   \immediate\write\@auxout{\string\urlauthor
     {#2}{\expandafter\strip@prefix\meaning\tmp}}%
  \egroup
}
\def\urlauthor#1#2{\g@addto@macro\@@@@uads{\let\corref\@gobble%
     \raggedright\eadsep{#1}\space(#2)%
     \def\eadsep{\unskip,\space}}%
}

\def\@@@authors{}
\def\pprinttitle{}
\let\authorsep\@empty
\let\sep\@empty
\newcounter{author}
\def\author{\@ifnextchar[{\@@author}{\@author}}
\let\pdfmeta@authors\@empty

\csdef{name@m}{%
  \def\inits##1{}%
  \def\fnm##1{##1}%
  \def\snm##1{##1}%
  \def\suffix##1{##1}%
}

\def\name@m@front#1{%
  \let\inits\@gobble
  \def\fnm##1{\def\@fnm{##1}}%
  \def\snm##1{\def\@snm{##1}}%
  \let\suffix\@gobble
  #1%
  \@fnm~\@snm%
  }

\def\name@m@ead#1{%
 \bgroup
  \def\inits##1{\def\@inits{##1}}%
  \let\fnm\@gobble
  \def\snm##1{\def\@snm{##1}}%
  \let\suffix\@gobble
  \let\corref\@gobble
  #1%
  \@inits~\@snm%
  \egroup
  }

\newtoks\@eadauthor
\def\@@author[#1]#2{%
   \g@addto@macro\@@@authors{\bgroup\normalsize\bfseries%
    \def\baselinestretch{1}%
    \name@m
    \authorsep\name@m@front{#2}\unskip\textsuperscript{%#1%
      \normalfont
      \@for\@@affmark:=#1\do{%
       \edef\affnum{\@ifundefined{X@\@@affmark}{1}{\@@@Ref{\@@affmark}}}%
     \unskip\sep\affnum\let\sep=,}%
      \ifx\@fnmark\@empty\else\unskip\sep\@fnmark\let\sep=,\fi
      \ifx\@corref\@empty\else\unskip\sep\@corref\let\sep=,\fi
      }%
    \egroup
    \def\authorsep{\unskip,\space}%
    \global\let\sep\@empty\global\let\@corref\@empty
    \global\let\@fnmark\@empty}%
    \@eadauthor={#2}%
    \bgroup\pdfmeta@clean
    \listxadd\pdfmeta@authors{#2}%
    \egroup
}

\def\@author#1{\g@addto@macro\@@@authors{\bgroup\normalsize\bfseries%
    \def\baselinestretch{1}%
    \upshape\authorsep\name@m@front{#1}\unskip\textsuperscript{%
     \normalfont
      \ifx\@fnmark\@empty\else\unskip\sep\@fnmark\let\sep=,\fi
      \ifx\@corref\@empty\else\unskip\sep\@corref\let\sep=,\fi
      }%
    \egroup
    \def\authorsep{\unskip,\space}%
    \global\let\@fnmark\@empty
    \global\let\sep\@empty}%
    \@eadauthor={#1}%
    \bgroup\pdfmeta@clean
     \listxadd\pdfmeta@authors{#1}%
    \egroup%
}
\def\pdfmeta@clean{\let\corref\@gobble\let\fnref\@gobble\let\fnm\@gobble\let\suffix\@gobble\let\inits\@firstofone\def\snm##1{\space##1}}

\def\@@@address{}
\def\addsep{\par\vskip6pt}
\def\address{\@ifnextchar[{\@@address}{\@address}}

\def\@alph#1{%
  \ifcase#1\or a\or b\or c\or d\or e\or f\or g\or h\or i\or j\or k\or
  l\or m\or n\or o\or p\or q\or r\or s\or t\or u\or v\or w\or x\or
  y\or z%
  \or aa\or ab\or ac\or ad\or ae\or af\or ag\or ah\or ai\or aj\or
  ak\or al\or am\or an\or ao\or ap\or aq\or ar\or as\or at\or au\or
  av\or aw\or ax\or ay\or az%
  \or ba\or bb\or bc\or bd\or be\or bf\or bg\or bh\or bi\or bj\or
  bk\or bl\or bm\or bn\or bo\or bp\or bq\or br\or bs\or bt\or bu\or
  bv\or bw\or bx\or by\or bz%
  \or ca\or cb\or cc\or cd\or ce\or cf\or cg\or ch\or ci\or cj\or
  ck\or cl\or cm\or cn\or co\or cp\or cq\or cr\or cs\or ct\or cu\or
  cv\or cw\or cx\or cy\or cz%
  \or da\or db\or dc\or dd\or de\or df\or dg\or dh\or di\or dj\or
  dk\or dl\or dm\or dn\or do\or dp\or dq\or dr\or ds\or dt\or du\or
  dv\or dw\or dx\or dy\or dz%
  \or ea\or eb\or ec\or ed\or ee\or ef\or eg\or eh\or ei\or ej\or
  ek\or el\or em\or en\or eo\or ep\or eq\or er\or es\or et\or eu\or
  ev\or ew\or ex\or ey\or ez%
  \or fa\or fb\or fc\or fd\or fe\or ff\or fg\or fh\or fi\or fj\or
  fk\or fl\or fm\or fn\or fo\or fp\or fq\or fr\or fs\or ft\or fu\or
  fv\or fw\or fx\or fy\or fz%
  \or ga\or gb\or gc\or gd\or ge\or gf\or gg\or gh\or gi\or gj\or
  gk\or gl\or gm\or gn\or go\or gp\or gq\or gr\or gs\or gt\or gu\or
  gv\or gw\or gx\or gy\or gz%
  \else\@ctrerr\fi}

\newcounter{affn}
\renewcommand\theaffn{\alph{affn}}

\long\def\@@address[#1]#2{\g@addto@macro\@@@address{%
    \def\baselinestretch{1}%
     \refstepcounter{affn}%
     \xdef\@currentlabel{\theaffn}%
     \@@@Label{#1}%
    \textsuperscript{\normalfont\theaffn}#2\par}}

\long\def\@address#1{\g@addto@macro\@@@address{%
    \def\baselinestretch{1}%
     #1\par}}

\newcommand\abstract@fmt[1]{\textbf{#1}}
\newcommand\abstract@name{Abstract}
\newcommand\abstract@name@skip{\enskip\enskip}
\newbox\absbox
\renewenvironment{abstract}{\global\setbox\absbox=\vbox\bgroup
  \hsize=\textwidth\def\baselinestretch{1}%
  \small
  \noindent\unskip\abstract@fmt{\abstract@name}%
  %\par\medskip
  \noindent\unskip
  \abstract@name@skip
  \ignorespaces
  }
 {\egroup}

\newbox\keybox
\def\keyword{%
  \def\sep{\unskip, }%
 \def\MSC{\@ifnextchar[{\@MSC}{\@MSC[2010]}}
  \def\@MSC[##1]{\par\vskip2pt\leavevmode\hbox {\textbf{##1~MSC}\enskip\enskip}}%
  \def\PACS{\par\leavevmode\hbox {\it PACS:\space}}%
  \def\JEL{\par\leavevmode\hbox {\it JEL:\space}}%
  \global\setbox\keybox=\vbox\bgroup\hsize=\textwidth
  \normalsize\normalfont\def\baselinestretch{1}%
  \small
  \parskip\z@
  \noindent\textbf{Keywords}\enskip\enskip%
  \raggedright                         % Keywords are not justified.
  \ignorespaces}%
\def\endkeyword{\par \egroup}

\newdimen\Columnwidth
\Columnwidth=\columnwidth

\def\printFirstPageNotes{%
  \iflongmktitle
   \let\columnwidth=\textwidth\fi
  \ifx\@tnotes\@empty\else\@tnotes\fi
  \ifx\@nonumnotes\@empty\else\@nonumnotes\fi
  \ifx\@cornotes\@empty\else\@cornotes\fi
  \ifx\@fnotes\@empty\else\@fnotes\fi
  \iflongmktitle\if@twocolumn
   \let\columnwidth=\Columnwidth\fi\fi
}

\long\def\pprintMaketitle{\clearpage
  \iflongmktitle\if@twocolumn\let\columnwidth=\textwidth\fi\fi
  \resetTitleCounters
  \def\baselinestretch{1}%
  \printFirstPageNotes
  \begin{center}%
 \thispagestyle{copyright}%
   \def\baselinestretch{1}%
    \bgroup\Large\bfseries\@title\egroup\par\vskip18pt
   \bgroup\large\bfseries
   \@@@authors\egroup\par\vskip10pt
    \normalfont\normalsize\itshape\@@@address\par
    \vskip1pc
\begin{printhistory}
    \print@history\par
\end{printhistory}
     \vskip12pt
    \ifvoid\absbox\else\unvbox\absbox\par\vskip10pt\fi
    \ifvoid\keybox\else\unvbox\keybox\par\vskip10pt\fi
    \end{center}%
  \gdef\thefootnote{\arabic{footnote}}%
  }

\def\printWarning{%
     \mbox{}\par\vfill\par\bgroup
     \fboxsep12pt\fboxrule1pt
     \hspace*{.18\textwidth}
     \fcolorbox{gray50}{gray10}{\box\warnbox}
     \egroup\par\vfill\thispagestyle{empty}
     \setcounter{page}{0}
     \clearpage}

\long\def\finalMaketitle{%
  \resetTitleCounters
  \def\baselinestretch{1}%
 \null\vskip-\topskip
  \vskip6pt
  \vbox to4.7pc{%
\vbox to -1.5pt{%
\vskip-4pc
\bgroup\normalfont\fontsize{8}{10}\selectfont
\noindent
\print@volume\\[-1.075pt]
\print@doi%\\[8pt]
\egroup
\vskip6.1pt
\hrule width \hsize
}%
  \vfill }%
   \enlargethispage{-4.5pc}%
   \MaketitleBox
   \thispagestyle{copyright}%
   \gdef\thefootnote{\arabic{footnote}}%
  }

\long\def\MaketitleBox{%
  \resetTitleCounters
  \def\baselinestretch{1}%
  \begin{center}%
   \def\baselinestretch{1}%
   \Large\textbf{\@title}\par\vskip18pt
    \@@@authors\par\vskip10pt
    \def\baselinestretch{1}%
    \normalfont\normalsize\itshape\@@@address%\par\vskip36pt
    \par%\vskip10pt
     \ifx.\@@@@eads.\else\footnotesize\vskip\baselineskip\normalfont
     \bgroup
      \@@@@eads
    \egroup
    \fi
    \vskip1pc
    \begin{printhistory}
      \print@history
    \end{printhistory}
     \vskip12pt
    \ifvoid\absbox\else\unvbox\absbox\par\vskip10pt\fi
    \ifvoid\keybox\else\unvbox\keybox\par\vskip10pt\fi
    \end{center}%
  }

\def\FNtext#1{\par\bgroup\footnotesize#1\egroup}
\newdimen\space@left
\def\alarm#1{\typeout{******************************}%
             \typeout{#1}%
             \typeout{******************************}%
}
\long\def\getSpaceLeft{%\global\@twocolumnfalse%
   \global\setbox0=\vbox{\hsize=\textwidth\MaketitleBox}%
   \global\setbox1=\vbox{\hsize=\textwidth
    \let\footnotetext\FNtext
    \printFirstPageNotes}%
    \xdef\noteheight{\the\ht1}%
    \xdef\titleheight{\the\ht0}%
    \@tempdima=\vsize
    \advance\@tempdima-\noteheight
    \advance\@tempdima-1\baselineskip
}

  \skip\footins=24pt

\newbox\@@@@boxa
\newbox\@@@@boxb

    \def\maketitle{%
      \iflongmktitle\getSpaceLeft
       \global\setbox\@@@@boxa=\vsplit0 to \@tempdima
       \box\@@@@boxa\par\resetTitleCounters
       \thispagestyle{copyright}%
       \printFirstPageNotes
       \box0%
      \else
       \finalMaketitle\printFirstPageNotes
      \fi
    \gdef\thefootnote{\arabic{footnote}}}%

\def\ps@copyright{%
     \let\@oddhead\@empty
     \let\@evenhead\@empty
     \def\@oddfoot{\copyright@line\credit@line}%
     \let\@evenfoot\@oddfoot}

\def\ps@headings{%
      \def\@evenhead{\footnotesize\thepage\hfil\itshape\leftmark}%
      \def\@oddhead{\footnotesize{\itshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
      \let\@oddfoot\@empty
      \let\@evenfoot\@empty
   }
\pagestyle{headings}

\renewcommand\section{\@startsection {section}{1}{\z@}%
           {-18\p@ \@plus -6\p@ \@minus -3\p@}%
           {9\p@ \@plus 6\p@ \@minus 3\p@}%
           {\normalsize\bfseries\boldmath}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
           {-12\p@ \@plus -6\p@ \@minus -3\p@}%
           {3\p@ \@plus 6\p@ \@minus 3\p@}%
           {\normalfont\normalsize\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
           {-12\p@ \@plus -6\p@ \@minus -3\p@}%
           {\p@}%
           {\normalfont\normalsize\itshape}}

\def\paragraph{\secdef{\@aparagraph}{\@bparagraph}}
\def\@aparagraph[#1]#2{\@@paragraph[#1]{#2.}}
\def\@bparagraph#1{\@@paragraph*{#1.}}

\newcommand\@@paragraph{\@startsection{paragraph}{4}{0\z@}%
           {10\p@ \@plus 6\p@ \@minus 3\p@}%
           {-6\p@}%
           {\normalfont\itshape}}

%% caption

\RequirePackage{caption}
\captionsetup{margin=0pt,font=small,labelfont=bf,labelsep=period}
\captionsetup[table]{position=top}
\renewcommand\figurename{Fig.}

\def\floatfmt{\centering\footnotesize}
\appto\@floatboxreset\floatfmt

\newenvironment{frontmatter}{}{%
\@temptokena={}%
\let\do\do@pdfmeta@authors
\dolistloop{\pdfmeta@authors}%
\maketitle
}


%% lists
\setlength{\topsep}{4pt plus2pt minus1pt}
\setlength{\partopsep}{0pt}
\setlength{\itemsep}{0pt}




\RequirePackage{natbib}

\setlength\bibsep{2pt plus.4pt minus.2pt}
\def\bibfont{\small}
\def\bibsection{\section*{\refname}}

\def\MR@url{http://www.ams.org/mathscinet-getitem?mr=}
\def\MR#1{\href{\MR@url#1}{MR#1}}

\def\set@bibl@cmd#1{\expandafter\def\csname #1\endcsname##1{{\csname #1@style\endcsname##1}}}
\def\set@bibl@env#1{\newenvironment{#1}{}{}}
\def\do#1{\set@bibl@cmd{#1}}
\docsvlist{bvolume,binits,bsnm,bparticle,bsuffix,bdegs,%
  bsertitle,batitle,bjtitle,bctitle,bbtitle,bauthor,%
  bissue,bnumber,bmonth,bedition,bpublisher,blocation,%
  bisbn,bfpage,blpage,byear,bcomment,%
  beditor,bseriesno,bconflocation,%
  oauthor}
\def\do#1{\set@bibl@env{#1}}
\docsvlist{barticle,bchapter,botherref,bbook}
\let\doiurl\url
\let\arxivurl\url
\let\adsurl\url
\let\endbibitem\relax
\let\betal@style\relax
\def\betal{{\betal@style et al.}}%
%% mathphys
\message{^^J Reference style: mathphys^^J}%
\def\bvolume@style{\bfseries}
\long\def\OrigBibText#1\endOrigBibText{}
\let\bptok\@gobble

\RequirePackage{xcolor}
\definecolor{linkblue}{rgb}{0 0.2 0.6}
\RequirePackage{hyperref}
\hypersetup{
 colorlinks=true,
 pdfborder={0 0 1},
 linkcolor=linkblue,
 citecolor=linkblue,
 urlcolor=linkblue,
 breaklinks,
}
\RequirePackage{bookmark}

\appto\maketitle{%
\hypersetup{%
  pdfinfo={%
    Title={\@title},
    Subject={},
    Author={\the\@temptokena},
    Creator={VTeX},
    Producer={VTeX},
  }}
}

\def\do@pdfmeta@authors#1{\if!\the\@temptokena!\def\pdfmeta@authors@sep{}\else\def\pdfmeta@authors@sep{, }\fi\edef\@a@{\noexpand\@temptokena={\the\@temptokena\pdfmeta@authors@sep#1}}\@a@}%

\frenchspacing

\endinput
%%
%% End of file `vmsta.cls'.
