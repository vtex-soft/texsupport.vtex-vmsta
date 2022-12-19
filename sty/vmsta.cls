%% This is file `vmsta.cls'.
%%
%% LaTeX 2e class file for articles in VMSTA journal published by VTeX.
%%
%% Macros written by VTeX Ltd., Lithuania
%% Please submit bugs or your comments to latex-support@vtex.lt
%%
%% Copyright 2014-2017 by VTEX UAB
%%
%% You are free to use this class file as you see fit, provided
%% that you do not make changes to the file.
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.3 or (at your option) any later version.
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vmsta}
    [2022/12/18 v1.4.27 VMSTA Journal class]
\def\fmt@name{vmsta}

\RequirePackage{etoolbox}

\DeclareOption{v1.0.1}{\csuse{class-version-v1.0.1}}

\csdef{class-version-v1.0.1}{%
  \AtBeginDocument{\flushbottom}%
  }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions*

\LoadClass{article}
%\RequirePackage{fixltx2e}
\usepackage[T1]{fontenc}
\InputIfFileExists{vmsta.cfg}{}{}

\def\@journal{Modern Stochastics: Theory and Applications}
\def\@journalabbrev{Modern Stoch. Theory Appl.}
\def\@journal@url{http://www.vmsta.org}
\def\@JOURNAL{MODERN STOCHASTICS: THEORY AND APPLICATIONS}
\def\@jid{vmsta}
\def\@JID{VMSTA}
\let\short@journal\@jid

\@ifundefined{doi@base}{\def\doi@base{https://doi.org/}}{}
\def\print@doi{\href{\doi@base\@doi}{\doi@base\@doi}}
\def\@ppages{\@firstpage--\@lastpage}
\def\print@volume{\@journal\space\@volume\space (\@issue) (\@pubyear) \@ppages}

\csdef{@volume}{0}
\csdef{@pubyear}{0000}
\csdef{@@ppages}{\empty}
\csdef{@firstpage}{0}
\csdef{@lastpage}{0}
\csdef{@doi}{\empty}

\def\volume#1{\gdef\@volume{#1}}
\def\issue#1{\gdef\@issue{#1}}
\def\pubyear#1{\gdef\@pubyear{#1}}
\def\firstpage#1{\gdef\@firstpage{#1}\setcounter{page}{#1}}
\def\lastpage#1{\gdef\@lastpage{#1}}
\def\doi#1{\gdef\@doi{#1}}

\def\logo@vtex{vmsta-logo-vtex}
\def\includevtexlogo{\null}
\def\@vtex@url{http://www.vtex.lt/en/}

\newif\if@open@access \global\@open@accesstrue
\def\cclicense@link{http://creativecommons.org/licenses/by/4.0/}
\def\@openaccess{Open access article under the \href{\cclicense@link}{CC BY} license.}
\def\copyright@statement{\lower5pc\hbox{\parbox{\textwidth}{\color[gray]{.7}\texttt{Preprint submitted to VTeX / Modern Stochastics: Theory and Applications\linebreak<\today>}}}}
\def\copyright@line{\@copyright@fmt{\copyright@statement}}
\def\@copyright@fmt#1{\vbox to0pt{\vskip-4.6pc\noindent\hbox{\footnotesize #1\hfill}\vss}}
\def\nocopyrightline{\gdef\copyright@line{\@copyright@fmt{}}}
\def\credit@line{\@credit@fmt{\@credit}}
\def\@credit@fmt#1{{\parindent0pt#1}}
\def\@credit{%
  \vbox to 0pt{%
    \vskip-1.85pc
    \hskip-\textwidth
    \noindent
    \raise4mm\hbox to \textwidth{%
      \footnotesize
      \href{\@journal@url}{www.vmsta.org}%
      \hfill
      \href{\@vtex@url}{\includevtexlogo}%
      }%
    }%
  }

\let\@received\@empty
\let\@revised\@empty
\let\@accepted\@empty
\let\@publishedonline\@empty
\def\received#1{\gdef\@received{{Received:~\hbox{#1}}}}
\def\revised#1{\gdef\@revised{{Revised:~\hbox{#1}}}}
\def\accepted#1{\gdef\@accepted{{Accepted:~\hbox{#1}}}}
\def\publishedonline#1{\gdef\@publishedonline{{Published~online:~\hbox{#1}}}}
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
\RequirePackage{amsthm}
\renewenvironment{proof}[1][\proofname]%
  {%
    \par
    \pushQED{\qed}%
    \normalfont \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item[\hskip\labelsep
          \bfseries
          #1\@addpunct{.}]%
    \ignorespaces
  }{%
    \popQED
    \endtrivlist
    \@endpefalse
  }%

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
\RequirePackage{array}

\ifdefined\HCode
\else
  \AtBeginDocument{%
    \let\Mathop\mathop
    \let\Mathord\mathord
    \let\Mathrel\mathrel
    \let\Mathbin\mathbin
    \let\Mathopen\mathopen
    \let\Mathclose\mathclose
    \let\Mathpunct\mathpunct
    }%
\fi

%% frontmatter
\newlength\printhistorymargin
\setlength\printhistorymargin{0pc}
\newenvironment{printhistory}
  {%
    \list{}{%
      \rightmargin\printhistorymargin
      \leftmargin\printhistorymargin
      }%
    \item\relax\centering
  }{%
    \par
    \endlist
  }

\newif\iflongmktitle \longmktitlefalse
\def\@@@Label#1{%
  \@bsphack
  \protected@write\@auxout{}{\string\Newlabel{#1}{\@currentlabel}}%
  \@esphack
  }
\def\Newlabel#1#2{%
  \expandafter\gdef\csname X@#1\endcsname{#2}%
  }
\def\@@@Ref#1{%
  \@ifundefined{X@#1}
    {0}
    {\csname X@#1\endcsname}%
  }
\RequirePackage{pifont}

\newcommand\abstract@fmt[1]{\textbf{#1}}
\newcommand\abstract@name{Abstract}
\newcommand\abstract@name@skip{\enskip\enskip}
\newbox\absbox
\renewenvironment{abstract}
  {%
    \global\setbox\absbox=\vbox\bgroup
    \hsize=\textwidth\def\baselinestretch{1}%
    \small
    \noindent\unskip\abstract@fmt{\abstract@name}%
    \noindent\unskip
    \abstract@name@skip
    \ignorespaces
  }{%
    \par
    \egroup
  }

\newcount\keyboxcnt
\newenvironment{keywords}[1][]%
  {%
    \expandafter\newsavebox\csname keybox#1\endcsname
    \@ifundefined{keybox@list}
      {%
        \csxdef{keybox@list}{keybox#1}%
      }{%
        \csxappto{keybox@list}{,keybox#1}%
      }%
    \def\@tempa{#1}%
    \def\PACS@name{PACS}%
    \def\JEL@name{JEL}%
    \def\MSC@MMX@name{MSC2010}%
    \ifx\@tempa\@empty
      \def\keywords@prefix{\textbf{Keywords}\enskip\enskip}%
    \else
      \ifx\@tempa\PACS@name
        \def\keywords@prefix{\it PACS:\space}%
      \else
        \ifx\@tempa\JEL@name
          \def\keywords@prefix{\textbf{JEL~classification}\enskip\enskip}%
        \else
          \ifx\@tempa\MSC@MMX@name
            \def\keywords@prefix{\textbf{2010~MSC}\enskip\enskip}%
            \def\MSC@active@keywords{1}%
          \else
            \def\keywords@prefix{\textbf{#1~MSC}\enskip\enskip}%
            \def\msc@tempa{2010}%
            \ifx\@tempa\msc@tempa
              \def\MSC@active@keywords{1}%
            \fi
          \fi
        \fi
      \fi
    \fi
    \@firstkwdtrue
    \global\advance\keyboxcnt\@ne
    \global\expandafter\setbox\csname keybox#1\endcsname=\vbox\bgroup
      \hsize=\textwidth
      \normalsize\normalfont
      \def\baselinestretch{1}%
      \small
      \parskip\z@
      % 10pt between abstract/keyword boxes and baselineskip + 2pt between keyword baselines
      \ifdefined\first@keyword@env
        \prevdepth\z@
        \vskip2pt
      \fi
      \noindent{\keywords@prefix}%
      \raggedright % Keywords are not justified.
      \ignorespaces
  }{%
      \par
    \egroup
    \gdef\first@keyword@env{1}%
  }

\newif\if@firstkwd
\def\kwd@sep{\unskip, }%
\def\msc@hrefprefix{http://www.ams.org/msc/msc2010.html?s=}
\newcommand\kwd[2][]{%
  \bgroup
    \def\@tempa{#1}%
    \if@firstkwd
      \global\@firstkwdfalse
      \let\kwd@sep\@empty
    \fi
    \ifx\@tempa\@empty
      \kwd@sep
    \else
      \@tempa
    \fi
    \ifdefined\MSC@active@keywords
      \href{\msc@hrefprefix #2}{#2}%
    \else
      #2%
    \fi
  \egroup
  \ignorespaces
  }

\newdimen\Columnwidth
\Columnwidth=\columnwidth

\def\printWarning{%
  \mbox{}\par\vfill\par
  \bgroup
    \fboxsep=12pt
    \fboxrule=1pt
    \hspace*{.18\textwidth}%
    \fcolorbox{gray50}{gray10}{\box\warnbox}%
  \egroup
  \par\vfill\thispagestyle{empty}%
  \setcounter{page}{0}%
  \clearpage
  }

\long\def\finalMaketitle{%
  \enlargethispage{-4.5pc}%
  \thispagestyle{copyright}%
  \MaketitleBox
  }

\def\output@frontmatter@authors{%
  \def\do##1{%
    \author@fmt{\the\c@author}{\csuse{##1t@loc@notes}}{\author@sep\csuse{##1}}%
    \def\author@sep{\unskip,\space}%
    }%
  \expandafter\docsvlist\expandafter{\author@list}%
  \par
  }

\def\validate@frontmatter@authors{%
  \def\do##1{%
    \setbox\@tempboxa=\hbox{%
      \let\degs\@gobble
      \let\prefix\@gobble
      \let\inits\@gobble
      \let\fnms\@gobble
      \let\snm\@gobble
      \let\suffix\@gobble
      \let\roles\@gobble
      \let\thanksref\@gobble
      \let\thanks\@gobble
      \let\thankstext\@gobble
      \def\ead####1####{\global\stepcounter{countead}}%
      \csname ##1\endcsname}%
    }%
  \expandafter\docsvlist\expandafter{\author@list}%
  }

\def\output@publishedonline{%
  \ifx\@empty\@publishedonline
  \else
    \publishedonline@prefix\hbox{\@publishedonline}\publishedonline@postfix
    \@historytrue
  \fi
  }

\AtBeginDocument{\csname \@articletype @articletype@control\endcsname}

\def\printaug{%
  \begin{flushright}
    \def\do##1{\csuse{##1}\\}%
    \expandafter\docsvlist\expandafter{\author@list}%
  \end{flushright}
  }

\ifdefined\HCode
  \let\printaug\relax
\else
  \def\editorial@articletype@control{%
    \let\output@frontmatter@authors\validate@frontmatter@authors
    \let\output@publishedonline\relax
    }
  \def\other@articletype@control{%
    \let\output@publishedonline\relax
    \gdef\author@list{}%
    \nocopyrightline
    }
\fi

\def\address@list{}
\def\title@preskip{57.4pt}
\def\title@afterskip{18pt}
\def\subtitle@afterskip{18pt}
\let\author@sep\relax
\def\editorial@word{editorial}
\long\def\MaketitleBox{%
  \def\baselinestretch{1}%
  \begin{center}%
    \def\baselinestretch{1}%
    \null
    \vskip\title@preskip
    \Large\textbf{\title@fmt{\@title}{\csuse{title@t@loc@notes}}}%
    \par
    \vskip\title@afterskip
    \ifdefined\@subtitle
      \large\textbf{\subtitle@fmt{\@subtitle}{\csuse{subtitle@t@loc@notes}}}%
      \par
      \vskip\subtitle@afterskip
    \fi
    \output@frontmatter@authors
    \ifx\@articletype\editorial@word
    \else
      \par
      \def\do##1{%
        \address@fmt{\csuse{##1@counter}}{\csuse{##1t@loc@notes}}{\csuse{##1}}%
        }%
      \expandafter\docsvlist\expandafter{\address@list}%
      \par
      %%\output@glob@notes
      \edef\temp@macro{\the\email@author@toks}%
      \footnotesize
      \normalfont
      \ifx\temp@macro\@empty
      \else
        \vskip\baselineskip
        \bgroup
          \the\email@author@toks
        \egroup
      \fi
      \par\vskip1pc
      \begin{printhistory}%
        \history@fmt
      \end{printhistory}%
    \fi
  \end{center}%
  \par
  \vskip11pt
  \ifdefined\@dedicated
    \unskip\vskip9.5pt
    \dedicated@fmt{\@dedicated}%
    \par\vskip15pt
  \fi
  \ifvoid\absbox
  \else
    \unvbox\absbox
    \par
    \vskip10pt
  \fi
  \ifdefined\keybox@list
    \newdimen\saveboxdepth
    \count@=\z@
    \def\do##1{%
      \saveboxdepth=\expandafter\dp\csname##1\endcsname
      \expandafter\unvbox\expandafter\csname ##1\endcsname
      \advance\count@\@ne
      % depth is 0 for all keyword boxes except the last one
      \ifnum\count@=\keyboxcnt
        \prevdepth=\the\saveboxdepth
      \else
        \addvspace{-\the\saveboxdepth}%
      \fi
      }%
    \expandafter\docsvlist\expandafter{\keybox@list}%
    \par
    \vskip10pt
  \fi
  }

\def\FNtext#1{\par\bgroup\footnotesize#1\egroup}
\newdimen\space@left
\def\alarm#1{%
  \typeout{******************************}%
  \typeout{#1}%
  \typeout{******************************}%
  }
\long\def\getSpaceLeft{%
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
    \finalMaketitle
  \fi
  }%

\def\ps@copyright{%
  \def\@oddhead{%
    \parbox[t]{\textwidth}{%
      \bgroup
        \normalfont\fontsize{8}{10}\selectfont
        \noindent
        \print@volume\\[-1.075pt]
        \print@doi
      \egroup
      \vskip6pt
      \hrule width\hsize
      }%
    }%
  \let\@evenhead\@oddhead
  \def\@oddfoot{\copyright@line\credit@line}%
  \let\@evenfoot\@oddfoot
  }

\def\ps@headings{%
  \def\@evenhead{\footnotesize\thepage\hfil\itshape\leftmark}%
  \def\@oddhead{\footnotesize{\itshape\rightmark}\hfil\thepage}%
  \let\@mkboth\markboth
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
  }
\pagestyle{headings}

\def\runtitle#1{\gdef\@runtitle{#1}}
\def\@runtitle{}
\def\runauthor#1{{\gdef\@runauthor{#1}}}
\def\@runauthor{}
\newif\ifrheads@set \rheads@setfalse
\AtBeginDocument{%
  \let\markboth@sav\markboth
  \def\markboth#1#2{%
    \settowidth\@tempdima{\footnotesize 000\quad {\itshape #1}}%
    \ifdim\@tempdima>\textwidth\relax
      \ClassError{vmsta}{Running title is too long, reassign it with \string\runauthor}{}%
    \fi
    \settowidth\@tempdima{\footnotesize {\itshape #2}\quad 000}%
    \ifdim\@tempdima>\textwidth\relax
      \ClassError{vmsta}{Running title is too long, reassign it with \string\runtitle}{}%
    \fi
    \markboth@sav{#1}{#2}%
    \rheads@settrue
    }%
  }
\def\runauthor@author@output#1{{%
  \csuse{\short@journal @inits@#1@author}\ \csuse{\short@journal @snm@#1@author}%
  \@ifundefined{\short@journal @inits@#1@author}{\csdef{\short@journal @inits@#1@author}{}}{}%
  \csletcs{@temp}{\short@journal @inits@#1@author}%
  \ifx\@temp\empty
    \@latex@error{missing \string\inits\space for headline #1, use \string\inits{} or reassign it with \string\runauthor!.}{}%
  \fi
  }}
\def\makerheads{%
  \ifrheads@set\else
    \if.\@runauthor.\relax
      \def\@runauthor{%
        \ifnum\value{author}<3\relax
          \ifcase\value{author}%
          \or
            \runauthor@author@output{1}%
          \or
            \runauthor@author@output{1},
            \runauthor@author@output{2}%
          \fi
        \else
          \runauthor@author@output{1} \betal
        \fi
        }%
    \fi
    \if.\@runtitle.\relax
      \def\@runtitle{\@title}%
    \fi
    \markboth{\@runauthor}{\@runtitle}%
  \fi
  }

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
\renewcommand\paragraph{\@startsection{paragraph}{4}{0\z@}%
           {10\p@ \@plus 6\p@ \@minus 3\p@}%
           {-6\p@}%
           {\paragraph@style}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{0\z@}%
           {10\p@ \@plus 6\p@ \@minus 3\p@}%
           {-6\p@}%
           {\subparagraph@style}}
\def\paragraph@style{\normalfont\itshape}
\def\subparagraph@style{\normalfont\itshape}

%% caption
\RequirePackage{caption}
\captionsetup{margin=0pt,font=small,labelfont=bf,labelsep=period}
\captionsetup[table]{position=top}
\renewcommand\figurename{Fig.}

\def\floatfmt{\centering\footnotesize}
\appto\@floatboxreset\floatfmt

\newtoks\fm@temp@toks
\newenvironment{frontmatter}
  {%
    \global\@firstauthortrue
    \let\saved@thefootnote\thefootnote
  }{%
    \do@pdfmeta@authors
    \maketitle
    \check@articletype@pretitle@status
    \ifnum\c@author=0\relax
    \else
        \ifnum\c@countead=0\relax
            \ClassError{vmsta}{At least one email address is required!}{}%
        \fi
    \fi
    \makerheads
  }
\def\check@articletype@pretitle@status{%
  \ifx\@articletype\@empty
    {\vtxClassError{\fmt@name}{Command \string\articletype{}\space is missing or is empty!}\@ehc}
  \fi
  \ifx\@pretitle\@empty
    {\vtxClassError{\fmt@name}{Command \string\pretitle{}\space is missing or is empty!}\@ehc}
  \fi
  }

\def\init@standard@footnote{%
  \ifdefined\init@standard@footnote@done
  \else
    \gdef\init@standard@footnote@done{1}%
    \global\let\thefootnote\saved@thefootnote
    \setcounter{footnote}{0}%
  \fi
  }

%% lists
\setlength{\topsep}{4pt plus2pt minus1pt}
\setlength{\partopsep}{0pt}
\setlength{\itemsep}{0pt}

\IfFileExists{vtexnatbib.sty}
  {\RequirePackage{vtexnatbib}}
  {\RequirePackage{natbib}}

\setlength\bibsep{2pt plus.4pt minus.2pt}
\def\bibfont{\small}
\def\bibsection{\section*{\refname}}

\let\bibcite@sav\bibcite
\long\def\bibcite#1#2{%
  \bibcite@sav{#1}{#2}%
  \def@bib@wdt#2%
  }
\def\bib@wdt{}
\def\def@bib@wdt#1#2#3#4{\gdef\bib@wdt{#1}}
\let\thebibliography@sav\thebibliography
\def\thebibliography#1{%
  \if.#1.\relax
    \thebibliography@sav{\bib@wdt}%
  \else
    \thebibliography@sav{#1}%
  \fi
  }

\def\MR@url{http://www.ams.org/mathscinet-getitem?mr=}
\def\MR#1{\href{\MR@url#1}{MR#1}}

\let\betal@style\relax
\def\betal{{\betal@style et al.}}%
%% mathphys
\message{^^J Reference style: mathphys^^J}%
\def\bvolume@style{\bfseries}

\RequirePackage{xcolor}
\definecolor{linkblue}{rgb}{0 0.4235 0.6392}
\ifdefined\HCode\else
  \RequirePackage{nameref}
\fi
\RequirePackage{hyperref}
\hypersetup{%
  colorlinks=true,
  pdfborder={0 0 1},
  linkcolor=linkblue,
  citecolor=linkblue,
  urlcolor=linkblue,
  breaklinks,
  hypertexnames=false
  }

\appto\maketitle{%
  \hypersetup{%
    pdfinfo={%
      Title={\@title},
      Subject={},
      Author={\the\pdfmeta@authors},
      Creator={VTeX},
      Producer={VTeX},
      }%
    }%
  }

\@namedef{vmsta@section@level@1@sep}{}
\@namedef{vmsta@section@level@2@sep}{}
\@namedef{vmsta@section@level@3@sep}{}
\@namedef{vmsta@section@level@4@sep}{.}
\@namedef{vmsta@section@level@5@sep}{.}
\def\vmsta@section@numlevel{0}
\def\vmsta@section@namelevel{undef}
\AtBeginDocument{%
  \global\let\vmsta@Sectionformat\Sectionformat
  \global\let\vmsta@startsection\@startsection
  \def\@startsection#1#2#3#4#5#6{%
    \xdef\vmsta@section@namelevel{#1}%
    \xdef\vmsta@section@numlevel{#2}%
    \vmsta@startsection{#1}{#2}{#3}{#4}{#5}{#6}%
    }%
  \gdef\Sectionformat#1#2{%
    \vmsta@Sectionformat{#1\@nameuse{vmsta@section@level@\vmsta@section@numlevel @sep}}{#2}%
    }%
  }

%% >>> index >>>
\usepackage{index}
\newindex{default}{idx}{ind}{Raw Index}
%% <<< index <<<

%% >>> startlocaldefs, endlocaldefs >>>
\let\check@localdefs@status\relax
\def\startlocaldefs{%
  \gdef\check@localdefs@status{\dbl@error{Missing command \string\endlocaldefs!}}%
  \gdef\startlocaldefs{\dbl@error{Command \string\startlocaldefs already exists!}}%
  \makeatletter}
\def\endlocaldefs{%
  \makeatother
  \ifx\check@localdefs@status\relax
    \gdef\check@localdefs@status{\dbl@error{Missing command \string\startlocaldefs!}}%
  \else
    \global\let\check@localdefs@status\relax
  \fi
  \gdef\endlocaldefs{\dbl@error{Command \string\endlocaldefs already exists!}}%
  }
\AtBeginDocument{\check@localdefs@status}%
%% <<< startlocaldefs, endlocaldefs <<<

%% >>> \bid >>>
\define@key{bid}{mr}{\def\bid@mr{\MR{#1}}}
\define@key{bid}{doi}{\def\bid@doi{\doiurl{#1}}}
\define@key{bid}{pubmed}{}
\define@key{bid}{pii}{}

\def\bid#1{%
  \bgroup
  \let\bid@output\@empty
  \setkeys{bid}{#1}\ignorespaces%
  % Output sequence:
  % <MR>. <DOI>
  \ifdefvoid\bid@mr{}{\appto\bid@output{\bid@mr}}%
  \ifdefvoid\bid@doi{}{%
    \ifdefempty\bid@output{}{\appto\bid@output{. }}% separator if output not empty
    \appto\bid@output{\bid@doi}%
    }%
  \bid@output
  \egroup
  }

\def\set@proof@mr{%
  \define@key{bid}{mr}{%
    \@nameuse{startchkuriskip}%
    \safe@href{http://www.ams.org/mathscinet-getitem?mr=##1}{MR##1}%
    \@nameuse{endchkuriskip}%
    \ignorespaces
    }%
  \define@key{bid}{doi}{%
    \ifnum\doc@stage<200\relax
      \@nameuse{startchkuriskip}%
      \safe@href{\doi@base ##1}{\doi@base ##1}%
      \@nameuse{endchkuriskip}%
      \space
    \fi
    }%
  }
\def\set@crc@mr{%
  \define@key{bid}{mr}{%
    \if@sici
      \global\@biblinktrue
    \fi
    \ignorespaces
    }%
  }
%% <<< \bid <<<

\frenchspacing

%% >>> Metadata >>>
\def\@publisher{VTeX}
\def\@publisheraddress{Mokslininkų g. 2A, 08412 Vilnius, Lithuania}
\def\@issn{2351-6046}
\def\@eissn{2351-6054}
\def\@articletype{}
\def\articletype#1{\gdef\@articletype{#1}}
\@onlypreamble\articletype
\def\aid#1{\gdef\@aid{#1}}
%% <<< Metadata <<<

%% >>> Frontmatter >>>
\def\@pretitle{}
\def\pretitle#1{\gdef\@pretitle{#1}}
\newenvironment{aug}
  {}
  {%
    \global\let\thefootnote\saved@thefootnote
    \setcounter{footnote}{\the\c@authornote}% footnote counter is continuous with authornote
  }
%% >>> author setup >>>
\def\author@font{\normalsize\bfseries}
\def\author@preskip{6\p@}
\newif\if@firstauthor
\newif\if@newelem
\def\cmd@for@aut@elem#1#2#3{% forms new command for inits and runauthor
  \global\@namedef{\short@journal @#1@#2@author}{#3}%
  }
\let\mdforvkt\@gobblethree
\let\orcid\@gobble

\newcounter{author}
\def\author{%
  \@ifnextchar[%
    {\author@optarg}
    {\author@optarg[]}%
  }
\def\author@optarg[#1]#2{%
  \stepcounter{author}%
  \def\degs##1{##1}%
  \def\prefix##1{%
    \protect\protected@write\@auxout{}{\string\global\string\@namedef{prefix@\the\c@author @metadata}{##1}}%
    ##1%
    }%
  \def\fnms##1{%
    \cmd@for@aut@elem{fnms}{\the\c@author}{##1}%
    ##1%
    }%
  \def\inits##1{%
    \csdef{@inits}{##1}%
    \protect\protected@write\@auxout{}{\string\global\string\@namedef{inits@\the\c@author @metadata}{##1}}%
    \cmd@for@aut@elem{inits}{\the\c@author}{##1}%
    }%
  \def\snm##1{%
    \csdef{@snm}{##1}%
    \protect\protected@write\@auxout{}{\string\global\string\@namedef{snm@\the\c@author @metadata}{##1}}%
    \cmd@for@aut@elem{snm}{\the\c@author}{##1}%
    ##1%
    }%
  \def\suffix##1{##1}%
  \def\roles##1{##1}%
  \beg@elem
  \@for\@tempa:=#1\do{\expandafter\add@addressref\expandafter{\@tempa}}%
  \let\oldunderscore\_%
  \let\_\textunderscore
  \init@fm@element{author}{#2}%
  \let\_\oldunderscore
  \temptoks=\expandafter{\@author}%
  \csxdef{author\the\c@author}{\the\temptoks}%
  \protected\csxdef{author\the\c@author t@loc@notes}{\the\t@loc@notes}%
  \@ifundefined{author@list}
    {%
      \xdef\author@list{author\the\c@author}%
    }{%
      \xappto\author@list{,author\the\c@author}%
    }%
  \csname author@end@hook\endcsname
  }%

\newtoks\pdfmeta@authors
\def\addto@pdfmeta@authors#1{%
  \begingroup
    \xdef\@act{\global\noexpand\pdfmeta@authors{\the\pdfmeta@authors#1}}%
    \@act
  \endgroup
  }
\def\do@pdfmeta@authors{%
  \@tempcnta\z@
  \@whilenum\@tempcnta<\c@author\do{%
    \advance\@tempcnta\@ne
    \ifnum\@tempcnta>\@ne
      \addto@pdfmeta@authors{, }%
    \fi
    \addto@pdfmeta@authors{%
      \@nameuse{inits@\the\@tempcnta @metadata}%
      \@ifundefined{inits@\the\@tempcnta @metadata}
        {}
        { }\@nameuse{snm@\the\@tempcnta @metadata}%
      }%
    }%
  }

\newtoks\temptoks
\def\author@fmt#1#2#3{%
  \ifdefined\author@fmt@init@done
  \else
    \author@fmt@init
  \fi
  \edef\@tempb{#2}%
  \ifx\@tempb\@empty
    #3%
  \else
    #3\fm@textsuperscript{#2}%
  \fi
  }
\def\fm@textsuperscript#1{%
  %$^{\mathrm{\scriptsize #1}}$%
  \unskip\textsuperscript{{\normalfont #1}}%
  }

\def\author@fmt@init{%
  \gdef\author@fmt@init@done{1}%
  \vskip\author@preskip
  \author@font
  \leavevmode
  }

\def\author@note@fmt{%
  \def\thefootnote{\sxarabic{footnote}}}

\def\sxarabic#1{%
  \expandafter
  \ifcase\value{#1}%
  \or *%
  \or **%
  \or ***%
  \or ****%
  \or *****%
  \fi
  }

\def\add@addressref#1{%
  \global\advance\note@cnt\@ne
  \ifnum\note@cnt>\@ne
    \add@xtok\t@loc@notes{\note@sep}%
  \fi
  \add@tok\t@loc@notes{#1}%
  }
\def\note@sep{,}
%% <<< author setup <<<

%% >>> affil setup >>>
\newcounter{address}
\def\address@font{\normalfont\normalsize\itshape}
\def\address@preskip{10\p@}
\def\address{%
  \@ifstar
    {\address@star}
    {\@ifnextchar[{\address@optarg}{\address@noptarg}}%
  }

\def\address@optarg[#1]#2{%
  \refstepcounter{address}%
  \beg@elem
  \init@fm@element{address}{#2}%
  \csxdef{address\the\c@address @counter}{\the\c@address}%
  \temptoks=\expandafter{\@address}%
  \csxdef{address\the\c@address}{\the\temptoks}%
  \protected\csxdef{address\the\c@address t@loc@notes}{\the\t@loc@notes}%
  \@ifundefined{address@list}
    {%
      \xdef\address@list{address\the\c@address}%
    }{%
      \xappto\address@list{,address\the\c@address}%
    }%
  \label{#1}%
  \csname address@end@hook\endcsname
  \ignorespaces
  }

\def\address@noptarg#1{%
  \refstepcounter{address}%
  \beg@elem
  \init@fm@element{address}{#1}%
  \csxdef{address\the\c@address @counter}{\z@}%
  \temptoks=\expandafter{\@address}%
  \csxdef{address\the\c@address}{\the\temptoks}%
  \protected\csxdef{address\the\c@address t@loc@notes}{\the\t@loc@notes}%
  \@ifundefined{address@list}
    {%
      \xdef\address@list{address\the\c@address}%
    }{%
      \xappto\address@list{,address\the\c@address}%
    }%
  \csname address@end@hook\endcsname
  \ignorespaces
  }

\def\address@star#1{%
  \beg@elem
  \init@fm@element{address}{#1}%
  \address@fmt{\m@ne}{\the\t@loc@notes}{\@address}%
  \ignorespaces
  }

\def\theaddress{\alph{address}}

\def\address@fmt#1#2#3{%
  \ifdefined\address@fmt@init@done
  \else
    \address@fmt@init
  \fi
  \bgroup
    \def\baselinestretch{1}%
    \address@font
    \ifnum#1=\z@
      #3\,\fm@textsuperscript{#2}\space
    \else
      \ifnum#1=\m@ne
        \phantom{\fm@textsuperscript{\@alph{#1}}\,}#3\,\fm@textsuperscript{#2}%
      \else
        \fm@textsuperscript{\@alph{#1}}#3\fm@textsuperscript{#2}%
      \fi
    \fi
    \par
  \egroup
  }
\def\address@fmt@init{%
  \gdef\address@fmt@init@done{1}%
  \vskip\address@preskip
  \leavevmode
  }
%% <<< affil setup <<<

%% >>> \beg@elem, \proc@elem (based on iosart2x.cls) >>>
\def\beg@elem{%
  \global\t@loc@notes={}%
  \global\note@cnt\z@
  }
\def\@xnamedef#1{%
  \expandafter\xdef\csname #1\endcsname
  }
\def\no@harm{%
  \let\\=\relax  \let\rm\relax
  \let\ss=\relax \let\ae=\relax \let\oe=\relax
  \let\AE=\relax \let\OE=\relax
  \let\o=\relax  \let\O=\relax
  \let\i=\relax  \let\j=\relax
  \let\aa=\relax \let\AA=\relax
  \let\l=\relax  \let\L=\relax
  \let\d=\relax  \let\b=\relax \let\c=\relax
  \let\bar=\relax
  \def\qq@group@start{}\def\qq@group@end{}\let\qq@cmd\@firstofone\def\qq@style{}%
  \def\protect{\noexpand\protect\noexpand}%
  }
\def\proc@elem#1#2{%
  \begingroup
    \no@harm
    \def\thanks##1##{\@gobble}%
    \def\thanksref##1##{\@gobble}%
    \@xnamedef{@#1}{#2}%
  \endgroup
  \prev@elem=\cur@elem
  \cur@elem=\csname e@#1\endcsname
  \expandafter\elem@nothanks#2\thanks\relax
  \expandafter\elem@nothanksref#2\thanksref\relax
  }
%% <<< \beg@elem, \proc@elem (based on iosart2x.cls) <<<

%% >>> thanks macro block >>>
\newtoks\t@glob@notes
\newtoks\t@loc@notes
\newcount\note@cnt
\newcount\c@ThanksID
\newcount\prev@elem \prev@elem=0
\newcount\cur@elem  \cur@elem=0
\chardef\e@pretitle=1
\chardef\e@title=1
\chardef\e@subtitle=1
\chardef\e@author=2
\chardef\e@address=3

\newif\if@thankshyperlink \global\@thankshyperlinkfalse

\def\add@tok#1#2{%
  \global#1\expandafter{\the#1#2}%
  }
\def\add@xtok#1#2{%
  \begingroup
    \no@harm
    \xdef\@act{%
      \global\noexpand#1{\the#1#2}%
      }%
    \@act
  \endgroup
  }

\newcounter{correspnote}
\def\corresp@note@counter{correspnote}
\newcounter{titlenote}
\def\title@note@counter{titlenote}
\def\subtitle@note@counter{titlenote}
\def\relatedarticle@note@counter{titlenote}
\def\correctionnote@note@counter{titlenote}
\def\correctedarticle@note@counter{titlenote}
\def\commentaryarticle@note@counter{titlenote}
\newcounter{authornote}
\def\author@note@counter{authornote}
\def\theauthornote{\arabic{authornote}}%
\def\thecorrespnote{%
  \ifcase\c@correspnote\relax
  \or
    $\ast$%
  \or
    $\ast\ast$%
  \or
    $\ast\ast\ast$%
  \fi
  }%
\def\thetitlenote{%
  \ifcase\c@titlenote\relax
  \or
    \protect\ding{73}%
  \or
    \protect\ding{73}\protect\ding{73}%
  \or
    \protect\ding{73}\protect\ding{73}\protect\ding{73}%
  \fi
  }%
\let\thesubtitlenote\thetitlenote

\let\thanks@id\@empty
\let\thanks@mark\@empty
\let\thanks@type\@empty
\define@key{thanks}{id}{\def\thanks@id{#1}}
\define@key{thanks}{mark}{\def\thanks@mark{#1}}
\define@key{thanks}{type}{\def\thanks@type{#1}}
\def\reset@thanks{%
  \let\thanks@id\@empty
  \let\thanks@mark\@empty
  \let\thanks@type\@empty
  }
\def\thanks@optarg@fmt#1#2{%
  \freefootnotetext[#1]{#2}%
  }
\def\thanks@optarg[#1]#2{%
  \let\thanks@type\@empty
  \setkeys{thanks}{#1}%
  \ifx\thanks@type\@empty
    \let\thanks@type\fm@object
  \fi
  \edef\current@counter{\csname\thanks@type @note@counter\endcsname}%
  \refstepcounter{\current@counter}%
  \setcounter{footnote}{\the\csname c@\current@counter\endcsname}%
  \def\thefootnote{\csname the\current@counter\endcsname}%
  \edef\thanks@optarg@id{\thanks@type.thanks\the\c@footnote.\jobname}%
  \@@@Label{\thanks@optarg@id}%
  \if@thankshyperlink %% TODO: make active links
    \ifx\thanks@id\@empty%
      \Hy@GlobalStepCount\Hy@linkcounter
      \xdef\thanks@currentHref{\thanks@type.thanks\the\c@footnote.\jobname.\the\Hy@linkcounter}%
      \edef\my@hy@tmp{\noexpand\hypertarget{\thanks@currentHref}{}}%
      %\edef\my@hy@tmp{\noexpand\hypertarget{\@currentHref}{}}% in case \refstepcounter{footnote} is used
    \else
      \edef\my@hy@tmp{\noexpand\hypertarget{\thanks@id thanks}{}}%
    \fi
    %\expandafter\add@tok\expandafter\t@glob@notes\expandafter{\expandafter{\my@hy@tmp #2}}%
    \ifx\thanks@mark\@empty
      \def\thanks@mark{\thefootnote}%
    \fi
      \freefootnotetext[\thanks@mark]{{\my@hy@tmp #2}}%
  \else
    \ifx\thanks@mark\@empty
      \def\thanks@mark{\thefootnote}%
    \fi
    \thanks@optarg@fmt{\thanks@mark}{#2}%
  \fi
  \csname end@thanks@optarg@hook\endcsname
  \ignorespaces
  }%
\def\freefootnotetext[#1]{%
  \begingroup
    \unrestored@protected@xdef\@thefnmark{#1}%
  \endgroup
  \@footnotetext
  }
%% TODO: do we need \tailthanksref?
\def\tailthanksref[#1]#2{%
  \noexpand\pthanksref{#1}%
  }
\def\pthanksref#1{%
  \global\advance\note@cnt\@ne
  \ifnum\note@cnt>\@ne
    \global\t@loc@notes\expandafter{\the\t@loc@notes\note@sep}%
  \fi
  \global\t@loc@notes\expandafter{\the\t@loc@notes#1}%
  }
\def\elem@nothanksref#1\thanksref{%
  \futurelet\@peektok\elem@thanksref
  }
\def\elem@thanksref{%
  \ifx\@peektok\relax
  \else
    \expandafter\elem@morethanksref
  \fi
  }
\def\elem@morethanksref#1{%
  \csxdef{#1@thankstext@type}{\fm@object}%
  \csletcs{thankstext@type}{#1@thankstext@type}%
  \add@thanks{id=#1}%
  \elem@nothanksref
  }
\def\elem@nothanks#1\thanks{%
  \futurelet\@peektok\elem@thanks
  }
\def\elem@thanks{%
  \ifx\@peektok\relax
  \else
    \ifx\@peektok[%
      \expandafter\expandafter\expandafter\elem@morethankse
    \else
      \expandafter\expandafter\expandafter\elem@morethanks
    \fi
  \fi
  }
\def\elem@morethankse[#1]#2{%
  \thanks@optarg[#1]{#2}%
  \add@thanks{#1}%
  \elem@nothanks
  }
\def\elem@morethanks#1{%
  \thanks@optarg[]{#1}%
  \add@thanks{}%
  \elem@nothanks
  }

\define@key{thankstext}{type}{\gdef\thankstext@type{#1}}
\define@key{thankstext}{id}{\gdef\thankstext@id{#1}}
\def\reset@thankstext{%
  \let\thankstext@id\@empty
  \let\thankstext@mark\@empty
  \let\thankstext@type\@empty
  }
\def\thankstext@fmt#1#2{%
  \freefootnotetext[#1]{#2}%
  }
\def\thankstext[#1]#2{%
  %\add@tok\t@glob@notes{%
    \reset@thankstext
    \setkeys{thankstext}{#1}%
    \ifx\thankstext@type\@empty
      \csletcs{thankstext@type}{\thankstext@id @thankstext@type}%
    \fi
    \edef\current@counter{\csname\thankstext@type @note@counter\endcsname}%
    \refstepcounter{\current@counter}%
    \setcounter{footnote}{\the\csname c@\current@counter\endcsname}%
    \def\thefootnote{\csname the\current@counter\endcsname}%
    \@@@Label{\thankstext@id}%
    \thankstext@fmt{\thefootnote}{\csname \thankstext@type @prehook\endcsname #2}%
    %}%
  }
\define@key{addthanks}{id}{\def\addthanks@id{#1}}
\define@key{addthanks}{mark}{\def\addthanks@mark{#1}}
\define@key{addthanks}{type}{\def\addthanks@type{#1}}
\def\reset@addthanks{%
  \let\addthanks@id\@empty
  \let\addthanks@mark\@empty
  \let\addthanks@type\@empty
  }
\def\add@thanks#1{%
  \reset@addthanks
  \setkeys{addthanks}{#1}%
  \global\advance\note@cnt\@ne
  \ifnum\note@cnt>\@ne
    \add@xtok\t@loc@notes{\note@sep}%
  \fi
  \if@thankshyperlink %% TODO: make active links
    \ifx\addthanks@id\@empty
      \add@xtok\t@loc@notes{\protect\Hy@breaklinkstrue
        \protect\hyper@linkstart{link}{\thanks@currentHref}\thefootnote\protect\hyper@linkend}%
        %\protect\hyper@linkstart{link}{\@currentHref}\thefootnote\protect\hyper@linkend}%
    \else
      \add@xtok\t@loc@notes{\protect\Hy@breaklinkstrue
        \protect\hyper@linkstart{link}{\addthanks@id thanks}\addthanks@id\protect\hyper@linkend}%
    \fi%
  \else
    \ifx\addthanks@id\@empty
      \def\addthanks@mark{\thefootnote}%
    \else
      \ifx\addthanks@mark\@empty
        \def\addthanks@mark{\@@@Ref{\addthanks@id}}%
      \fi
    \fi
    \add@xtok\t@loc@notes{\addthanks@mark}%
  \fi
  \csname end@add@thanks@hook\endcsname
  }
\newcount\c@sv@footnote
\def\output@glob@notes{%
  \bgroup
    \the\t@glob@notes
  \egroup
  }
%% <<< thanks macro block <<<

%% >>> init FM element setup >>>
\newcommand\init@fm@element[3][]{%
  \def\fm@object{#2}%
  \ifcsname init@fm@#2@done\endcsname
  \else
    \setkeys{#2}{#1}%
  \fi
  \csgdef{init@fm@#2@done}{1}%
  \proc@elem{#2}{#3}%
  }
%% <<< init FM element setup <<<

%% >>> title/subtitle setup >>>
\def\title#1{%
  \beg@elem
  \init@fm@element{title}{#1}%
  \protected\csxdef{title@t@loc@notes}{\the\t@loc@notes}%
  \csname title@end@hook\endcsname
  }
\def\subtitle#1{%
  \beg@elem
  \init@fm@element{subtitle}{#1}%
  \protected\csxdef{subtitle@t@loc@notes}{\the\t@loc@notes}%
  \csname subtitle@end@hook\endcsname
  }
\def\title@fmt#1#2{%
  \bgroup
    #1\hbox{\title@textsuperscript{#2}}%
  \egroup
  }
\let\subtitle@fmt\title@fmt
\def\title@textsuperscript#1{\textsuperscript{#1}}
%% <<< title/subtitle setup <<<

%% >>> email >>>
\def\ead@mark{}
\def\ead@href#1#2{\href{#1}{\ead@mark}}
\def\email@author@fmt{%
  (%
  \ifx\@inits\@empty
  \else
    \@inits\space
  \fi
  \@snm
  )%
  }
\newtoks\email@author@toks
%% blocked use of printead.sty in author environment
\newcounter{countead}
\def\ead@hook#1#2{%
    \stepcounter{countead}%
    \ifx.#2.
        \gdef\ead@mark{???}%
    \else
        \gdef\ead@mark{#2}%
    \fi
    }
\providecommand\ead[2][]{{%
%% few necessary printead.sty definitions
  \define@key{ead}{label}{\def\ead@id{#1}}%
  \define@key{ead}{email}[true]{\def\ead@type{email}}%
  \def\@setead##1##2##3{%
    \bgroup
      \csname @setead@hook\endcsname
      \expandafter\xdef\csname ead@##1@##2\endcsname{##3}%
    \egroup
    }%
  \def\ead@hrefprefix@email{mailto:}%
  %
  \csname before@ead@hook\endcsname
  \setkeys{ead}{label={},email,#1}%
  \@setead{\ead@id}{options}{#1}%
  \@setead{\ead@id}{type}{\ead@type}%
  \@setead{\ead@id}{value}{#2}%
  \csedef{\ead@id @email@author}{\email@author@fmt}%
  \def\email@type{email}%
  \ifx\ead@type\email@type
    \ead@hook{#1}{#2}%
    \add@xtok\email@author@toks{%
      \csuse{emailauthor@sep}%
      \ead@href{\ead@hrefprefix@email #2}{#2}~\hbox{\csuse{\ead@id @email@author}}%
      }%
    \gdef\emailauthor@sep{\unskip,\space}%
  \fi
  \csname after@ead@hook\endcsname
  }\ignorespaces}
%% <<< email <<<

%% >>> history >>>
%% history month - full name
\def\setvaluelist#1#2{%
  \@tempcnta=0\relax
  \@for\@curr@val:=#2\do{%
    \advance\@tempcnta by1\relax
    \expandafter\protected@xdef\csname #1@item@\the\@tempcnta\endcsname{\@curr@val}%
    }%
    \expandafter\protected@xdef\csname #1@item@0\endcsname{\the\@tempcnta}%
  }
\xdef\getitemvalue#1#2{\noexpand\csname #1@item@#2\endcsname}
\def\sday#1{#1}
\def\syear#1{#1}
\def\smonth#1{\@ifundefined{month@item@#1}%
  {\vtxClassError{\fmt@name}{There is no month with number '#1'!}\@ehc}%
  {\getitemvalue{month}{#1}}%
}%
\setvaluelist{month}{January,February,March,April,May,June,July,August,September,October,November,December}
\expandafter\def\csname month@item@0\endcsname{????}

\newif\if@history \@historyfalse
\def\define@history@date#1{%
  \expandafter\def\csname #1\endcsname##1{%
    \def\@tempa{##1}%
    \ifx\@tempa\@empty
    \else
      \csgdef{@#1}{##1}%
    \fi
    }%
  }
\define@history@date{received}
\define@history@date{revised}
\define@history@date{accepted}
\define@history@date{publishedonline}

\def\received@prefix{Received:~}
\def\revised@prefix{Revised:~}
\def\accepted@prefix{Accepted:~}
\def\publishedonline@prefix{Published~online:~}
\def\received@postfix{}
\def\revised@postfix{}
\def\accepted@postfix{}
\def\publishedonline@postfix{}
\def\history@prefix{}
\def\history@postfix{}

\def\history@sep{%
  \if@history
    , \allowbreak
  \fi
  }
\def\history@fmt{%
  \history@prefix
  \ifx\@empty\@received
  \else
    \received@prefix\hbox{\@received}\received@postfix
    \@historytrue
    \history@sep
  \fi
  \ifx\@empty\@revised
  \else
    \revised@prefix\hbox{\@revised}%\revised@postfix
    \@historytrue
    \history@sep
  \fi
  \ifx\@empty\@accepted
  \else
    \accepted@prefix\hbox{\@accepted}\accepted@postfix
    \@historytrue
    \history@sep
  \fi
  \output@publishedonline
  \history@postfix
  }
%% <<< history <<<

\let\cny\@firstofone
\let\dept\@firstofone
\let\institution\@firstofone
\let\addr\@firstofone
\let\city\@firstofone

\def\dedicated#1{%
  \gdef\@dedicated{#1}%
  }
\def\dedicated@fmt#1{%
  \normalsize\itshape
  #1%
  }
%% <<< Frontmatter <<<

%% fix footnote Postscript /Dest position
\let\orig@H@@footnotetext\H@@footnotetext
\long\def\H@@footnotetext#1{{%
  \def\@pdfview{XYZ}%
  \def\@pdfviewparams{ pdf@hoff pdf@voff \strip@pt\baselineskip\space 72.27 div 72 mul add null}%
  \orig@H@@footnotetext{#1}%
  }}

%% definitions execution after \begin{document} (for tex4ht)
\ifdefined\HCode
  {
  \catcode`#=12\relax
  \catcode`&=6\relax
  \gdef\startlocaldefs{%
    \catcode`#=12\relax
    \makeatletter
    \@startlocaldefs
    }
  \gdef\@startlocaldefs@toks{}%
  \long\gdef\@startlocaldefs&1\endlocaldefs{%
    \long\xdef\@startlocaldefs@toks{\detokenize{&1}}%
    \makeatother
    \catcode`#=6\relax
    }
  }
  \appto\document{\makeatletter\expandafter\scantokens\expandafter{\@startlocaldefs@toks}\makeatother}%
\fi

%% Acknowledgement
\define@key{acknowledgement}{title}{\def\acknowledgement@title{#1}}
\def\acknowledgement@title{Acknowledgement}
\newenvironment{acknowledgement}[1][]%
  {%
    \setkeys{acknowledgement}{#1}%
    \section*{\acknowledgement@title}%
  }{%
    \par
  }

%% >>> Funding >>>
\def\@afterbox{%
  \everypar{%
    \if@nobreak
      \@nobreakfalse
      \clubpenalty \@M
      \if@afterindent \else
        {\setbox\z@\lastbox}%
        \everypar{}%2015-04-09
      \fi
    \else
      \clubpenalty \@clubpenalty
      {\setbox\z@\lastbox}%
      \everypar{}%
    \fi
    }%
  }

\newenvironment{Env@EndOfContrib}[1]
  {%
    \if@noskipsec\leavevmode\fi
    \par
    \@afterindenttrue
    \if@nobreak
      \everypar{}%
    \else
      \addpenalty\@secpenalty\addvspace\baselineskip
    \fi
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
        {\setbox\z@\lastbox}%
        \clubpenalty\@M
        {%
          %\sffamily
          \bfseries#1\\\\%
        }%
        %\unskip\hskip0.5em\relax
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi
      }%
    \ignorespaces
  }{%
    \par
    \vskip\baselineskip
    \aftergroup\@afterbox
  }

\define@key{gsponsor}{id}{\def\gsponsor@id{#1}}
\define@key{gsponsor}{sponsor-id}{\def\gsponsor@sponsorid{#1}}
\define@key{gnumber}{refid}{\def\gnumber@refid{#1}}

\def\gsponsor@fmt#1{#1}
\def\gnumber@fmt#1{#1}

\newcommand\gsponsor[2][]{%
  \bgroup
    \setkeys{gsponsor}{#1}%
    \gsponsor@fmt{#2}%
  \egroup
  }
\newcommand\gnumber[2][]{%
  \bgroup
    \setkeys{gnumber}{#1}%
    \gnumber@fmt{#2}%
  \egroup
  }

\def\fundingname{Funding}
\def\funding{\Env@EndOfContrib\fundingname}
\let\endfunding\endEnv@EndOfContrib
%% <<< Funding <<<

\endinput
%%
%% End of file `vmsta.cls'.
