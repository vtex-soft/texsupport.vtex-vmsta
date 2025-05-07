%% This is file `vmsta2.cls'.
%%
%% LaTeX 2e class file for articles in VMSTA journal published by VTeX.
%%
%% Macros written by VTeX Ltd., Lithuania
%% Please submit bugs or your comments to latex-support@vtex.lt
%%
%% Copyright 2025 by VTEX UAB
%%
%% You are free to use this class file as you see fit, provided
%% that you do not make changes to the file.
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.3 or (at your option) any later version.
%%
\NeedsTeXFormat{LaTeX2e}[2021/06/01]
\ProvidesClass{vmsta2}[2025/04/30 v2.0.9 VMSTA Journal class (ST)]
% 
\ExplSyntaxOn
\cs_gset_eq:NN \tl@if@blank@@nTF \tl_if_blank:nTF
\ExplSyntaxOff
\long\def\if@not@empty#1#2{\tl@if@blank@@nTF{#1}{}{#2}}
\long\def\if@not@x@empty#1#2{\expandafter\tl@if@blank@@nTF\expandafter{#1}{}{#2}}
\def\if@toks@not@empty#1{%
    \bgroup
        \edef\tmp@toks@data{\the#1}%
        \ifx\@empty\tmp@toks@data
            \aftergroup\@gobble
        \fi
    \egroup
    }
\long\def\g@addto@hook#1#2{\global#1\expandafter{\the#1#2}}
\long\def\x@addto@hook#1#2{%
    \begingroup
        \let\protect\@unexpandable@protect
        \edef\reserved@a{\global\protect#1{\the#1#2}}%
        \reserved@a
    \endgroup
    }
%
\DeclareOption{nolmlargesymbols}{\xdef\vmsta@nolmlargesymbols{1}}
\DeclareOption{nolmsymbols}{\xdef\vmsta@nolmsymbols{1}}
\DeclareOption{nolmoperators}{\xdef\vmsta@nolmoperators{1}}
\DeclareOption{nolmaddons}{%
    \xdef\vmsta@nolmlargesymbols{1}%
    \xdef\vmsta@nolmoperators{1}%
    \xdef\vmsta@nolmsymbols{1}%
    }
%
\DeclareOption{rotating}{\AtEndOfClass{\RequirePackage{rotating}}}
%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}
%
\IfFileExists{vmsta2-vtex.cfg}%
    {\input{vmsta2-vtex.cfg}}%
    {%
        \IfFileExists{vmsta2-dist.cfg}%
            {\input{vmsta2-dist.cfg}}%
            {\ClassError{vmsta2}{configuration file 'vmsta2-dist.cfg' is needed}{}}%
    }
%
\@ifpackageloaded{kvsetkeys}{}{\RequirePackage{kvsetkeys}}
%% metadata
\def\@journal{Modern Stochastics: Theory and Applications}
\def\@journalabbrev{Modern Stoch. Theory Appl.}
\def\@journal@url{http://www.vmsta.org}
\def\@JOURNAL{MODERN STOCHASTICS: THEORY AND APPLICATIONS}
\def\@jid{vmsta} \let\short@journal\@jid
\def\@JID{VMSTA}
\def\@publisher{VTeX}
\def\@publisheraddress{Mokslininkų g. 2A, 08412 Vilnius, Lithuania}
\def\@issn{2351-6046}
\def\@eissn{2351-6054}
%% preamble
\def\doi#1{\gdef\@doi{#1}}
\let\@doi\@empty
\def\doi@base{https://doi.org/}
\def\print@doi{\href{\doi@base\@doi}{\doi@base\@doi}}
\def\volume#1{\gdef\@volume{#1}}
\def\@volume{0}
\def\issue#1{\gdef\@issue{#1}}
\def\pubyear#1{\gdef\@pubyear{#1}}
\def\@pubyear{0000}
\def\firstpage#1{\gdef\@firstpage{#1}\setcounter{page}{#1}}
\def\@firstpage{0}
\def\lastpage#1{\gdef\@lastpage{#1}}
\def\@lastpage{0}
\def\print@volume{\@journal\space\@volume\space (\@issue) (\@pubyear) \@firstpage--\@lastpage}
\def\aid#1{\gdef\@aid{#1}}
\def\articletype#1{%
    \if@not@empty{#1}{%
        \gdef\@articletype{#1}%
        \AtBeginDocument{\@nameuse{articletype@#1@settings}}%
        }%
    }
\let\@articletype\@empty
\def\articletype@other@settings{%
    \let\copyright@line\@empty
    \let\history@fmt\@empty
    \let\author@fmt\@gobble
    }
\def\articletype@editorial@settings{%
    \let\author@fmt\author@fmt@editorial
    \let\history@fmt\@empty
    }
\@onlypreamble\articletype
\let\check@localdefs@status\relax
\def\startlocaldefs{%
    \gdef\check@localdefs@status{\ClassError{vmsta2}{Missing command \string\endlocaldefs!}{}}%
    \gdef\startlocaldefs{\ClassError{vmsta2}{Command \string\startlocaldefs already exists!}{}}%
    \makeatletter
    }
\def\endlocaldefs{%
    \makeatother
    \ifx\check@localdefs@status\relax
        \gdef\check@localdefs@status{%
            \ClassError{vmsta2}{Missing command \string\startlocaldefs!}{}%
            }%
    \else
        \global\let\check@localdefs@status\relax
    \fi
    \gdef\endlocaldefs{\ClassError{vmsta2}{Command \string\endlocaldefs already exists!}{}}%
    }
%%
\def\vtex@logo{V\TeX}
\def\vtex@url{https://www.vtex.lt/en/}
\def\preprint@statement{Preprint submitted to VTeX / \@journal}
\def\pdfmeta@subject{\preprint@statement}
\let\copyright@statement\preprint@statement
\let\copyright@fmt@other\gobble
\def\copyright@line{\copyright@fmt{\copyright@statement}}
\def\copyright@fmt#1{%
    \vbox to\z@{\vskip0.4\p@
        \noindent
        \parbox{\textwidth}{%
            \footnotesize\raggedright
            \color[gray]{.7}\texttt{\copyright@statement\linebreak<\today>}%
            }%
        \vss
        }%
    }
\def\credit@line{%
    \bgroup
        \parindent\z@
        \vbox to\z@{%
            \vskip-21.581102\p@
            \hskip-\textwidth
            \noindent
            \hb@xt@ \textwidth{%
                \footnotesize
                \href{\@journal@url}{www.vmsta.org}%
                \hfill\href{\vtex@url}{\vtex@logo}%
                }%
            }%
    \egroup
    }
%
\usepackage[T1]{fontenc}
\ifdefined\HCode\else
    \RequirePackage{nimbusserif}
    \RequirePackage{nimbusmono}
    \RequirePackage[scaled=0.9]{nimbussans}
\fi
\RequirePackage{textcomp}
\RequirePackage{pifont}
%
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
\DeclareDocumentEnvironment{proof}{O{\proofname}}
    {%
        \par
        \pushQED{\qed}%
        \normalfont \topsep6\p@\@plus6\p@\relax
        \trivlist
        \item[\hskip\labelsep \bfseries #1\@addpunct{.}]%
        \ignorespaces
    }{%
        \popQED
        \endtrivlist
        \@endpefalse
    }%
\ifdefined\HCode
\else
    \RequirePackage[cmintegrals,bigdelims]{newtxmath}
    \ifdefined\vmsta@nolmlargesymbols
    \else
        % growing brackets in newtxmath are somewhat buggy
        \DeclareSymbolFont{lmlargesymbols}{OMX}{mlmex}{m}{n}
        \SetSymbolFont{lmlargesymbols}{bold}{OMX}{mlmex}{m}{n}
        \DeclareMathDelimiter{(}{\mathopen}{symbols}{185}{lmlargesymbols}{"00}
        \DeclareMathDelimiter{)}{\mathclose}{symbols}{186}{lmlargesymbols}{"01}
        \DeclareMathDelimiter{[}{\mathopen}{symbols}{187}{lmlargesymbols}{"02}
        \DeclareMathDelimiter{]}{\mathclose}{symbols}{188}{lmlargesymbols}{"03}
        \DeclareMathDelimiter{\lfloor}{\mathopen}{symbols}{98}{lmlargesymbols}{"04}
        \DeclareMathDelimiter{\rfloor}{\mathclose}{symbols}{99}{lmlargesymbols}{"05}
        \DeclareMathDelimiter{\lceil}{\mathopen}{symbols}{100}{lmlargesymbols}{"06}
        \DeclareMathDelimiter{\rceil}{\mathclose}{symbols}{101}{lmlargesymbols}{"07}
        \DeclareMathDelimiter{\lbrace}{\mathopen}{symbols}{215}{lmlargesymbols}{"08}
        \DeclareMathDelimiter{\rbrace}{\mathclose}{symbols}{216}{lmlargesymbols}{"09}
    \fi
    \ifdefined\vmsta@nolmsymbols
    \else
        \DeclareSymbolFont{lmsymbols}{OMS}{lmsy}{m}{n}
        \SetSymbolFont{lmsymbols}{normal}{OMS}{lmsy}{m}{n}
        \SetSymbolFont{lmsymbols}{bold}{OMS}{lmsy}{b}{n}
        \DeclareSymbolFontAlphabet{\mathcal}{lmsymbols}
    \fi
    \ifdefined\vmsta@nolmoperators
    \else
        \DeclareSymbolFont{lmoperators}{OT1}{lmr}{m}{n}
        \SetSymbolFont{lmoperators}{normal}{OT1}{lmr}{m}{n}
        \SetSymbolFont{lmoperators}{bold}{OT1}{lmr}{bx}{n}
        \re@DeclareMathAccent{\bar}{\mathalpha}{lmoperators}{"16}
    \fi
\fi
%
\RequirePackage{geometry}
\geometry{%
    twoside,%
    paperwidth=6.125in,%
    paperheight=9.25in,%
    textheight=562\p@,%
    textwidth=119mm,%
    centering,%
    headheight=50\p@,%
    headsep=12\p@,%
    footskip=12\p@,%
    footnotesep=24\p@ plus2\p@ minus1\p@
    }
\RequirePackage{graphicx}
\RequirePackage{array}
%% pagestyles
\def\ps@copyright{%
    \def\@oddhead{%
        \parbox[t]{\textwidth}{%
            \bgroup
                \normalfont\fontsize{8}{10}\selectfont
                \noindent\print@volume\\[-1.075\p@]%
                \print@doi
            \egroup
            \vskip6\p@
            \hrule width\hsize
            }%
        }%
    \let\@evenhead\@oddhead
    \def\@oddfoot{%
        \copyright@line\credit@line
        }%
    \let\@evenfoot\@oddfoot
    }
\def\ps@headings{%
    \def\@evenhead{%
        \UseHook{vmsta2/head/start}%
        \footnotesize\thepage\hfil\itshape\leftmark
        \UseHook{vmsta2/head/stop}%
        }%
    \def\@oddhead{%
        \UseHook{vmsta2/head/start}%
        \footnotesize{\itshape\rightmark}\hfil\thepage
        \UseHook{vmsta2/head/stop}%
        }%
    \let\@mkboth\markboth
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
    }
\def\runtitle#1{\gdef\@runtitle{#1}}
\let\@runtitle\@empty
\def\runauthor#1{\gdef\@runauthor{#1}}
\let\@runauthor\@empty
\def\running@title@control{%
    \bgroup
        \settowidth\@tempdima{\footnotesize 000\quad {\itshape\@runauthor}}%
        \ifdim\@tempdima>\textwidth\relax
            \ClassError{vmsta2}{Running title is too long, reassign it with \string\runauthor}{}%
            \global\let\@runauthor\@empty
        \fi
        \settowidth\@tempdima{\footnotesize{\itshape\@runtitle}\quad 000}%
        \ifdim\@tempdima>\textwidth\relax
            \ClassError{vmsta2}{Running title is too long, reassign it with \string\runtitle}{}%
            \global\let\@runtitle\@empty
        \fi
    \egroup
    }
\def\print@author@info#1#2{%
    \bgroup
        \@tempcnta=#1\relax
        \suppress@au@tags
        \def\ead##1##{\@gobble}%
        \def\inits##1{\g@addto@macro#2{##1 }}%
        \def\snm##1{\g@addto@macro#2{##1}}%
        \def\author[##1]##2{##2%
            \advance\@tempcnta by\m@ne
            \ifnum\@tempcnta>\z@
                \g@addto@macro#2{, }%
            \else
                \def\author[####1]####2{}%
            \fi
            }%
        \setbox\@tempboxa\hbox{\the\authors@list}%
    \egroup
    }
\def\make@page@headers{%
    \ifx\@runauthor\@empty
        \ifcase\c@author
        \or
            \print@author@info{1}\@runauthor
        \or
            \print@author@info{2}\@runauthor
        \else
            \print@author@info{1}\@runauthor
            \g@addto@macro\@runauthor{~\betal}%
        \fi
    \fi
    \ifx\@runtitle\@empty
        \gdef\@runtitle{\@title}%
    \fi
    \running@title@control
    \markboth{\@runauthor}{\@runtitle}%
    }
%% sections
\def\add@inline@section@sep#1#2{{#2#1}}
\def\section{\@startsection {section}{1}{\z@}%
    {-18\p@ \@plus -6\p@ \@minus -3\p@}%
    {9\p@ \@plus 6\p@ \@minus 3\p@}%
    {\normalsize\bfseries\boldmath}}
\def\subsection{\@startsection{subsection}{2}{\z@}%
    {-12\p@ \@plus -6\p@ \@minus -3\p@}%
    {3\p@ \@plus 6\p@ \@minus 3\p@}%
    {\normalfont\normalsize\itshape}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}%
    {-12\p@ \@plus -6\p@ \@minus -3\p@}%
    {\p@}%
    {\normalfont\normalsize\itshape}}
\def\paragraph{\@startsection{paragraph}{4}{\z@}%
    {10\p@ \@plus 6\p@ \@minus 3\p@}%
    {-6\p@}%
    {\normalfont\itshape\add@inline@section@sep{.}}}
\def\subparagraph{\@startsection{subparagraph}{5}{\z@}%
    {10\p@ \@plus 6\p@ \@minus 3\p@}%
    {-6\p@}%
    {\normalfont\itshape\add@inline@section@sep{.}}}
%% floats
\def\figurename{Fig.}
\g@addto@macro\@floatboxreset{\centering\footnotesize}
\def\table@abovecaptionskip{1.5\p@}
\def\table@belowcaptionskip{13\p@}
\def\figure@caption@size{\small}
\def\table@caption@size{\small}
\abovecaptionskip=6.5\p@
\belowcaptionskip=3.5\p@
\long\def\@makecaption#1#2{%
    \ifcsname\@captype @abovecaptionskip\endcsname
        \expandafter\vskip\csname\@captype @abovecaptionskip\endcsname
    \else
        \vskip\abovecaptionskip
    \fi
    \csname\@captype @caption@size\endcsname
    \sbox\@tempboxa{%
        \textbf{#1.} #2%
        }%
    \ifdim\wd\@tempboxa>\hsize
        \textbf{#1.} #2\par
    \else
        \global\@minipagefalse
        \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
    \normalize@prevdepth
    \ifcsname\@captype @belowcaptionskip\endcsname
        \expandafter\vskip\csname\@captype @belowcaptionskip\endcsname
    \else
        \vskip\belowcaptionskip
    \fi
    }
%% lists
\topsep=4\p@ plus2\p@ minus1\p@
\partopsep=\z@
\itemsep=\z@
\RequirePackage[hyperref]{xcolor}
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
    hypertexnames=false,
    localanchorname=true
    }
%\def\HyperDestNameFilter#1{\jobname.#1}
\newtoks\pdfmeta@authors
\def\do@pdfmeta@authors{%
    \bgroup
        \suppress@au@tags
        \def\ead##1##{\@gobble}%
        \def\inits##1{\g@addto@hook\pdfmeta@authors{##1 }}%
        \def\snm##1{\g@addto@hook\pdfmeta@authors{##1}}%
        \let\author@sep\@empty
        \def\author[##1]##2{\x@addto@hook\pdfmeta@authors{\author@sep}##2\def\author@sep{, }}%
        \setbox\@tempboxa\hbox{\the\authors@list}%
    \egroup
    }
\def\hy@setup@pdfinfo{%
    \do@pdfmeta@authors 
    \hypersetup{%
        pdfinfo={%
            Title={\pdfmeta@title},%
            Subject={\pdfmeta@subject},%
            Author={\the\pdfmeta@authors},%
            Keywords={\pdfmeta@keywords},%
            }%
        }%
    }
%% frontmatter
\def\frontmatter@addons{%
    \make@page@headers
    \hy@setup@pdfinfo
    \check@articletype@pretitle@status
    \check@email@address@status
    }
\DeclareDocumentEnvironment{frontmatter}{}
    {%
        \def\baselinestretch{1}%
        \enlargethispage{-54\p@}%
        \thispagestyle{copyright}%
        \bgroup
            \centering
            \null
    }{%
            \par
            \if@history \history@fmt \fi
        \egroup
        \frontmatter@addons
        \ifdefined\@dedicated \dedicated@fmt \fi
        \vskip11\p@
        \if@toks@not@empty\abstract@data{\the\abstract@data\vskip10\p@}%
        \if@toks@not@empty\keywords@data{\the\keywords@data\vskip8\p@}%
    }
%% helper macros
\def\normalize@prevdepth{%
    \ifdim\prevdepth>\z@
        \ifdim\prevdepth<\dp\strutbox
            \vskip-\prevdepth
        \else
            \vskip-\dp\strutbox
        \fi
    \fi
    \hrule width\textwidth height\z@
    \kern\z@
    }
\def\write@pdfinfo#1#2{%
    \begingroup
        \def\note@sep{, }%
        \no@harm@in@vmsta
        \let\protect\@unexpandable@protect
        \immediate\write\@auxout{\string\gdef\string#1{#2}}%
    \endgroup
    }%
\def\no@harm@in@vmsta{%
    \let\thanks=\@gobble \let\thanksref=\@gobble \let\corref=\@gobble
    \let~\space \let\\=\@empty \def\protect{\noexpand\protect\noexpand}%
    \let\.\@firstofone \let\v\@firstofone \let\k\@firstofone \let\=\@firstofone
    \def\qq@group@start{}\def\qq@group@end{}\def\qq@style{}\let\qq@cmd\@firstofone
    }
\newtoks\t@glob@notes
\newtoks\t@loc@notes
\def\set@note@sep{\let\note@sep\note@@sep}
\def\note@@sep{,}
\let\cur@elem@item\relax
\let\prev@elem@item\relax
\def\init@elem@start#1{%
    \global\t@loc@notes={}%
    \let\note@sep\set@note@sep
    \global\let\prev@elem@item\cur@elem@item
    \gdef\cur@elem@item{#1}%
    \@ifundefined{c@#1}{}{\stepcounter{#1}}%
    \ifx\prev@elem@item\cur@elem@item
    \else
        \@nameuse{#1@proc@elem@new}%
    \fi
    \@nameuse{#1@proc@elem@start}%
    }
\def\init@elem@stop#1{\@nameuse{#1@proc@elem@stop}}
\def\write@elem@label#1#2{%
    \@ifundefined{write@#1@label}{\label{#2}}{\@nameuse{write@#1@label}{#2}}%
    }
%% thanks[text] / footnotes
\def\@asterisksymb#1{%
    \ifcase#1%
    \or 
        \TextOrMath{\textasteriskcentered}{*}%
    \or
        \TextOrMath{\textasteriskcentered\textasteriskcentered}{**}%
    \or
        \TextOrMath
            {\textasteriskcentered\textasteriskcentered\textasteriskcentered}%
            {***}%
    \or
        \TextOrMath
            {%
                \textasteriskcentered\textasteriskcentered
                \textasteriskcentered\textasteriskcentered
            }%
            {****}%
    \or
        \TextOrMath
            {%
                \textasteriskcentered\textasteriskcentered\textasteriskcentered
                \textasteriskcentered\textasteriskcentered
            }%
            {*****}%
    \else
        \@ctrerr 
    \fi
    }
\@definecounter{corresp}
\def\thecorresp{\@asterisksymb\c@corresp}
\def\foots@penalty{\@MM}
\skip\footins=24\p@
\NewHook{vmsta2/footnotemark/start}
\NewHook{vmsta2/footnotemark/stop}
\NewHook{vmsta2/footnotetext/start}
\NewHook{vmsta2/footnotetext/stop}
\NewHook{vmsta2/makefntext/start}
\NewHook{vmsta2/makefntext/stop}
\long\def\@footnotetext#1{%
    \insert\footins{%
        \reset@font\footnotesize \interlinepenalty=\interfootnotelinepenalty
        \splittopskip=\footnotesep \splitmaxdepth=\dp\strutbox
        \floatingpenalty=\foots@penalty %% \@MM in TLDIST
        \hsize=\columnwidth \@parboxrestore
        %%\def\@currentcounter{footnote}%
        \protected@edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}%
        \color@begingroup
            \UseHook{vmsta2/footnotetext/start}%
            \@makefntext{%
                \rule\z@\footnotesep
                \UseHook{vmsta2/makefntext/start}%
                \ignorespaces#1%
                \UseHook{vmsta2/makefntext/stop}%
                \@finalstrut\strutbox
                }%
            \UseHook{vmsta2/footnotetext/stop}%
            %%\par
        \color@endgroup
        }%
    }%
\def\freefootnotetext[#1]{%
    \begingroup
        \unrestored@protected@xdef\@thefnmark{#1}%
    \endgroup
    \@footnotetext
    }
\def\@makefnmark{%
    \hbox{%
        \UseHook{vmsta2/footnotemark/start}%
        \@textsuperscript{\normalfont\@thefnmark}%
        \UseHook{vmsta2/footnotemark/stop}%
        }%
    }
\def\add@thanksref@items#1{\addto@hook\t@loc@notes{\note@sep\ref{#1-thanks}}}
\NewHook{vmsta2/thanks/end}
\DeclareDocumentCommand\thanksref{>{\SplitList{,}}m}{%
    \ProcessList{#1}{\add@thanksref@items}%
    }
\DeclareDocumentCommand\thanks{om}{%
    \refstepcounter{footnote}\label{#1thanks}%
    \freefootnotetext[\thefootnote]{#2}%
    \ignorespaces
    }
\kv@set@family@handler{thankstext}{\global\@namedef{thankstext@#1}{#2}}
\def\thankstext[#1]#2{%
    \kvsetkeys{thankstext}{id={},mark={},type={footnote},#1}%
    \@ifundefined{c@\thankstext@type}%
        {\refstepcounter{footnote}}%
        {\refstepcounter{\thankstext@type}}%
    \label{\thankstext@id-thanks}%
    \freefootnotetext[\csname the\thankstext@type\endcsname]{#2}%
    \ignorespaces
    \UseHook{vmsta2/thanks/end}%
    }
%% pretitle
\let\@pretitle\@empty
\def\pretitle#1{\gdef\@pretitle{#1}\ignorespaces}
\def\check@articletype@pretitle@status{%
    \ifx\@articletype\@empty
        \ClassError{\fmt@name}{Command \string\articletype\space is missing or is empty!}\@ehc
    \fi
    \ifx\@pretitle\@empty
        \ClassError{\fmt@name}{Command \string\pretitle\space is missing or is empty!}\@ehc
    \fi
    }
%% title
\NewHook{vmsta2/title/start}
\NewHook{vmsta2/title/stop}
\kv@set@family@handler{title}{\global\@namedef{title@#1}{#2}}
\kvsetkeys{title}{%
    size={\Large\bfseries\mathversion{bold}},%
    beforeskip=57.4\p@,%
    afterskip={20\p@},%
    }
\def\pdfmeta@title{}
\DeclareDocumentCommand\title{om}{%
    \IfNoValueF{#1}{\kvsetkeys{title}{#1}}%
    \write@pdfinfo{\pdfmeta@title}{#2}%
    \gdef\@title{#2}%
    \vskip\title@beforeskip
    \bgroup
        \let\note@sep\set@note@sep
        \title@size
        \quitvmode
        \UseHook{vmsta2/title/start}%
        #2\if@not@x@empty{\the\t@loc@notes}{\textsuperscript{{\normalfont\the\t@loc@notes}}}%
        \UseHook{vmsta2/title/stop}%
        \par
    \egroup
    \normalize@prevdepth
    \vskip\title@afterskip
    }
%% aug 
\newcounter{aug}
\DeclareDocumentEnvironment{aug}{}%
    {%
        \stepcounter{aug}%
        \expandafter\newtoks\csname aug@\the\c@aug @toks\endcsname
        \let\author\aug@author
        \let\address\aug@address
    }%
    {%
        \expandafter\the\csname aug@\the\c@aug @toks\endcsname%
        \if@toks@not@empty\email@author@toks{%
            \bgroup
                \normalfont
                \footnotesize
                \vskip\baselineskip
                \the\email@author@toks
                \par
            \egroup
            }%
        \ignorespaces
    }
%% author
\NewHook{vmsta2/author/start}
\NewHook{vmsta2/author/stop}
\newtoks\authors@list
\newcounter{author}
\def\author@beforeskip{6\p@}
\def\author@fontsize{\normalsize\bfseries}
\def\make@au@tags{%
    \let\degs\@firstofone \let\prefix\@firstofone \def\inits##1{\def\@inits{##1}}%
    \let\fnms\@firstofone \def\snm##1{\def\@snm{##1}##1}%
    \let\suffix\@firstofone \let\roles\@firstofone \let\orcid\@gobble
    \let\index\@gobble
    }
%% email
\newtoks\email@author@toks
\newcounter{countead}
\let\email@ead@sep\@empty
\def\ead@type@email{email}
\kv@set@family@handler{ead}{\global\@namedef{ead@#1}{#2}}
\let\empty@email@hook\@empty
\ifdefined\HCode\else
    \DeclareDocumentCommand\ead{om}{%
        \bgroup
            \kvsetkeys{ead}{id={\number\c@countead},label={},type=email,#1}%
            \ifx\ead@type\ead@type@email
                \stepcounter{countead}%
                \tl@if@blank@@nTF{#2}{\def\ead@mark{???\empty@email@hook}}{\def\ead@mark{#2}}%
                \x@addto@hook\email@author@toks{%
                    \noexpand\email@ead@sep
                    \href{#2}{\ead@mark}~\hbox{(\if@not@x@empty{\@inits}{\@inits\space}\@snm)}%
                    \noexpand\gdef\noexpand\email@ead@sep{\unskip,\space}%
                    }%
            \fi
        \egroup
        \ignorespaces
        }
\fi
\let\email\ead
\def\add@addressref#1{\addto@hook\t@loc@notes{\note@sep\ref{address-#1-\the\c@aug}}}
\def\author@proc@elem@new{%
    \par 
    \vskip\author@beforeskip
    \hrule width\textwidth height\z@
    \def\author@item@sep{\gdef\author@item@sep{, \allowbreak}}%
    \quitvmode
    }
\def\author@proc@elem@stop{\unskip\ignorespaces}
\def\author@fmt#1{%
    \author@item@sep
    \UseHook{vmsta2/author/start}%
    #1\unskip\if@not@x@empty{\the\t@loc@notes}{\textsuperscript{{\normalfont\the\t@loc@notes}}}%
    \UseHook{vmsta2/author/stop}%
    }
\DeclareDocumentCommand\aug@author{om}{%
    \expandafter\g@addto@hook\csname aug@\the\c@aug @toks\endcsname{\@author[#1]{#2}}%
    }
\DeclareDocumentCommand\@author{>{\SplitList{,}}om}{%
    \bgroup
        \init@elem@start{author}%
        \IfNoValueF{#1}{\ProcessList{#1}{\add@addressref}}%
        \make@au@tags \author@fontsize
        \author@fmt{#2}%
        \g@addto@hook\authors@list{\author[#1]{#2}}%
        \init@elem@stop{author}%
    \egroup
    }
\def\author@fmt@editorial#1{%
    \bgroup
        \suppress@au@tags
        \setbox\@tempboxa=\hbox{#1}%
    \egroup
    }
\def\suppress@au@tags{%
    \let\degs\@gobble \let\prefix\@gobble \let\inits\@gobble
    \let\fnms\@gobble \let\snm\@gobble \let\suffix\@gobble
    \let\roles\@gobble \let\orcid\@gobble \let\thanksref\@gobble
    \let\thanks\@gobble \let\thankstext\@gobble \let\index\@gobble
    \def\ead##1##{\stepcounter{countead}}%
    }
\ifdefined\HCode
    \let\printaug\relax
\else
    \def\printaug{%
        \begin{flushright}%
            \make@au@tags \def\ead##1##{\@gobble}%
            \let\thanksref\@gobble \let\thanks\@gobble \let\thankstext\@gobble 
            \def\author[##1]##2{##2\\}%
            \the\authors@list
        \end{flushright}%
        }
\fi
\def\check@email@address@status{%
    \ifnum\c@author=0\relax
    \else
        \ifnum\c@countead=0\relax
            \ClassError{vmsta2}{At least one email address is required!}{}%
        \fi
    \fi
    }
%% address
\NewHook{vmsta2/address/start}
\NewHook{vmsta2/address/stop}
\newcounter{address}
\def\address@beforeskip{14\p@}
\def\make@address@tags{%
    \let\cty\@firstofone \def\cny##1##{\@firstofone}%
    \let\dept\@firstofone \let\institution\@firstofone
    \let\addr\@firstofone \let\city\@firstofone
    }
\def\write@address@label#1{%
    \bgroup
        \protected@edef\@currentlabel{\theaddress}%
        \label{#1}%
    \egroup
    }
\def\address@proc@elem@new{%
    \par 
    \vskip\address@beforeskip
    \hrule width\textwidth height\z@
    }%
\def\address@proc@elem@start{%
    \make@address@tags 
    \gdef\theaddress{\@alph\c@address}%
    \normalfont\normalsize\itshape
    }
\def\address@proc@elem@stop{\unskip\ignorespaces}
\DeclareDocumentCommand\aug@address{om}{%
    \expandafter\g@addto@hook\csname aug@\the\c@aug @toks\endcsname{\@address[#1]{#2}}%
    }
\DeclareDocumentCommand\@address{om}{%
    \bgroup
        \init@elem@start{address}%
        \IfValueTF{#1}%
            {\edef\cur@addr@label{address-#1-\the\c@aug}}%
            {\edef\cur@addr@label{address-\the\c@address-\the\c@aug}}%
        \write@elem@label{address}{\cur@addr@label}%
        \UseHook{vmsta2/address/start}%
        \IfNoValueF{#1}{\smash{$^{\mathrm{\theaddress}}$}}%
        #2%
        \if@not@x@empty{\the\t@loc@notes}{\,$^{\mathrm{\the\t@loc@notes}}$}%
        \UseHook{vmsta2/address/stop}%
        \strut\par
        \init@elem@stop{address}%
    \egroup
    }
%% history
\let\sday\@firstofone
\let\syear\@firstofone
\def\smonth#1{\@month{#1}}
\protected\def\@month#1{%
    \ifcase#1\ClassError{vmsta2}{There is no month with number '#1'!}\@ehc
        \or January\or February\or March\or April\or May\or June%
        \or July\or August\or September\or October\or November\or December%
    \else
        \ClassError{vmsta2}{There is no month with number '#1'!}\@ctrerr
    \fi
    }
\newif\if@history \@historyfalse
\NewHook{vmsta2/history/start}
\NewHook{vmsta2/history/stop}
\NewHookWithArguments{vmsta2/history.item/box}{1}
\def\history@prefix{%
    \vskip12\p@\footnotesize\quitvmode
    %\UseHook{vmsta2/history/start}%
    }
\def\history@postfix{%
    %\UseHook{vmsta2/history/stop}%
    \par
    }
\def\received@prefix{Received:~}
\def\revised@prefix{Revised:~}
\def\accepted@prefix{Accepted:~}
\def\publishedonline@prefix{Published~online:~}
\DeclareDocumentCommand\received{m}
    {\if@not@empty{#1}{\gdef\@received{#1}\global\@historytrue}}%
\DeclareDocumentCommand\revised{m}
    {\if@not@empty{#1}{\gdef\@revised{#1}\global\@historytrue}}%
\DeclareDocumentCommand\accepted{m}
    {\if@not@empty{#1}{\gdef\@accepted{#1}\global\@historytrue}}%
\DeclareDocumentCommand\publishedonline{m}
    {\if@not@empty{#1}{\gdef\@publishedonline{#1}\global\@historytrue}}%
\def\history@item@sep{\def\history@item@sep{, \allowbreak}}
\def\history@item@fmt#1{%
    \ifcsname @#1\endcsname
        \history@item@sep
        \hbox{%
            \UseHookWithArguments{vmsta2/history.item/box}{1}{#1}%
            \@nameuse{#1@prefix}\@nameuse{@#1}%
            }%
    \fi
    }
\def\history@fmt{%
    \bgroup 
        \history@prefix
        \history@item@fmt{received}%
        \history@item@fmt{revised}%
        \history@item@fmt{accepted}%
        \history@item@fmt{publishedonline}%
        \history@postfix
    \egroup
    }
\def\dedicated#1{\gdef\@dedicated{#1}}
\def\dedicated@fmt{%
    \vskip9.5\p@
    \bgroup
        \normalsize\itshape\@dedicated\par
    \egroup
    \vskip4\p@
    \ignorespaces
    }
%% abstract 
\def\abstract@name@fmt#1{\textbf{#1}}
\def\abstract@name{Abstract}
\def\abstract@name@skip{\enskip\enskip}
\newtoks\abstract@data \abstract@data={}
\DeclareDocumentEnvironment{abstract}{+b}{%
    \global\abstract@data{%
        \bgroup
            \def\baselinestretch{1}\small
            \noindent\abstract@name@fmt{\abstract@name}\abstract@name@skip
            \ignorespaces #1\par
        \egroup
        }%
    }%
    {}
%% keywords
\NewHook{vmsta2/keywords/start}
\NewHook{vmsta2/keywords/stop}
\NewHook{vmsta2/kwd/start}
\NewHook{vmsta2/kwd/stop}
\newtoks\pdfmeta@kwd@toks
\def\keywords@class@Keywords@settings{%
    \def\keywords@class@name{Keywords}%
    }
\def\keywords@class@JEL@settings{%
    \def\keywords@class@name{JEL~classification}%
    }
\@namedef{keywords@class@MSC2010@settings}{%
    \def\keywords@class@name{2010 MSC}%
    \def\keywords@item@fmt##1{%
        \href{https://www.ams.org/msc/msc2010.html?s=##1}{##1}%
        }%
    }
\@namedef{keywords@class@MSC2020@settings}{%
    \def\keywords@class@name{2020 MSC}%
    \def\keywords@item@fmt##1{%
        \href{https://www.ams.org/msc/msc2020.html?s=##1}{##1}%
        }%
    }
\def\keywords@item@pdfmeta#1{%
    \if@not@x@empty{\the\pdfmeta@kwd@toks}{\g@addto@hook\pdfmeta@kwd@toks{, }}%
    \g@addto@hook\pdfmeta@kwd@toks{#1}%
    }
\def\keywords@class@name@fmt#1{\textbf{#1}}
\DeclareDocumentCommand\kwd{om}{%
    \IfValueTF{#1}{#1\init@kwd@sep}{\kwd@sep}%
    \UseHook{vmsta2/kwd/start}%
    \keywords@item@pdfmeta{#2}%
    \keywords@item@fmt{#2}\ignorespaces%
    \UseHook{vmsta2/kwd/stop}%
    }
\kv@set@family@handler{keywords}{\global\@namedef{keywords@key@#1}{#2}}
\newtoks\keywords@data \keywords@data={}
\DeclareDocumentEnvironment{keywords}{o+b}%
    {%
        \g@addto@hook\keywords@data{%
            \IfValueTF{#1}{\kvsetkeys{keywords}{class=#1}}{\kvsetkeys{keywords}{class={Keywords}}}%
            \def\init@kwd@sep{\def\kwd@sep{\unskip, }\let\init@kwd@sep\@empty}%
            \let\kwd@sep\init@kwd@sep
            \let\keywords@item@fmt\@firstofone
            \ifcsname keywords@class@\keywords@key@class @settings\endcsname
                \csname keywords@class@\keywords@key@class @settings\endcsname
            \else
                \def\keywords@class@name{\keywords@key@class~MSC}%
                \def\keywords@item@fmt##1{%
                    \href{https://www.ams.org/msc/msc2020.html?s=##1}{##1}%
                    }%
            \fi
            \vbox{%
                \UseHook{vmsta2/keywords/start}%
                \normalfont\small\raggedright
                \parskip=\z@ \def\baselinestretch{1}%
                \noindent\keywords@class@name@fmt{\keywords@class@name}\enskip\enskip\ignorespaces
                #2\par
                \prevdepth=\z@ \vskip2\p@
                \UseHook{vmsta2/keywords/stop}%
                }%
            }%
    }%
    {}
%
\def\pdfmeta@keywords{}
\AddToHook{enddocument/afterlastpage}[vmsta2/auxstuff]{%
    \write@pdfinfo{\pdfmeta@keywords}{\the\pdfmeta@kwd@toks}%
    }
%
\kv@set@family@handler{acknowledgement}{\global\@namedef{acknowledgement@#1}{#2}}
\DeclareDocumentEnvironment{acknowledgement}{O{title={Acknowledgement}}}%
    {%
        \kvsetkeys{acknowledgement}{#1}%
        \section*{\acknowledgement@title}%
    }{%
        \par
    }
%% funding
\def\@afterbox{%
    \everypar{%
        \if@nobreak
            \@nobreakfalse
            \clubpenalty\@M
            \if@afterindent 
            \else
                {\setbox\z@\lastbox}%
                \everypar{}%
            \fi
        \else
            \clubpenalty\@clubpenalty
            {\setbox\z@\lastbox}%
            \everypar{}%
        \fi
        }%
    }
\DeclareDocumentEnvironment{funding}{O{Funding}}%
    {%
        \def\funding@name{#1}%
        \if@noskipsec 
            \leavevmode
        \fi
        \par
        \@afterindenttrue
        \if@nobreak
            \everypar{}%
        \else
            \addpenalty\@secpenalty \addvspace\baselineskip
        \fi
        \@nobreakfalse \global\@noskipsectrue
        \everypar{%
            \if@noskipsec
                \global\@noskipsecfalse
                {\setbox\z@\lastbox}%
                \clubpenalty\@M
                {\bfseries\funding@name\\\\}%
            \else
                \clubpenalty\@clubpenalty \everypar{}%
            \fi
            }%
        \ignorespaces
    }%
    {%
        \par
        \vskip\baselineskip
        \aftergroup\@afterbox
    }
\kv@set@family@handler{gsponsor}{\global\@namedef{gsponsor@#1}{#2}}
\let\gsponsor@fmt\@firstofone
\DeclareDocumentCommand\gsponsor{om}{%
    \bgroup
        \kvsetkeys{gsponsor}{id={},sponsor-id={}}%
        \IfNoValueF{#1}{\kvsetkeys{gsponsor}{#1}}%
        \gsponsor@fmt{#2}%
    \egroup
    }
\kv@set@family@handler{gnumber}{\global\@namedef{gnumber@#1}{#2}}
\let\gnumber@fmt\@firstofone
\DeclareDocumentCommand\gnumber{om}{%
    \bgroup
        \kvsetkeys{gnumber}{refid={},#1}%
        \IfNoValueF{#1}{\kvsetkeys{gnumber}{#1}}%
        \gnumber@fmt{#2}%
    \egroup
    }
%% bibliography
\IfFileExists{vtexnatbib.sty}{\RequirePackage{vtexnatbib}}{\RequirePackage{natbib}}
\bibsep=2\p@ plus.4\p@ minus.2\p@
\let\bibfont\small
\def\bibsection{\section*{\refname}}
\def\vmsta@bibcite{%
    \let\bib@label@wd\@empty
    \let\bibcite@saved\bibcite
    \long\def\bibcite##1##2{%
        \gdef\bib@label@wd{##2}%
        \bibcite@saved{##1}{##2}%
        }%
    }
\AddToHook{begindocument/before}{\vmsta@bibcite}
\def\vmsta@thebibliography{%
    \let\thebibliography@saved\thebibliography
    \def\thebibliography##1{%
        \def\@firstoffour####1####2####3####4{####1}%
        \thebibliography@saved{%
            \IfBlankTF{##1}%
                {\expandafter\@firstoffour\bib@label@wd\@empty\@empty\@empty\@empty}%
                {##1}%
            }%
        }%
    }%
\AddToHook{env/thebibliography/begin}{\vmsta@thebibliography}
\def\bvolume@style{\bfseries}
\def\bid@mr@fmt{\MR{\bid@mr}}
\def\bid@doi@fmt{\doiurl{\bid@doi}}
\kv@set@family@handler{bid}{\global\@namedef{bid@#1}{#2}}
\def\bid#1{%
    \bgroup
        \def\bid@item@sep{\def\bid@item@sep{. }}%
        \kvsetkeys{bid}{mr={},doi={},pubmed={},pii={},#1}%
        \ignorespaces
        \if@not@x@empty{\bid@mr}{\bid@item@sep\bid@mr@fmt}%
        \if@not@x@empty{\bid@doi}{\bid@item@sep\bid@doi@fmt}%
    \egroup
    }
%% index
\let\vmsta@sv@check@eq\@check@eq
\let\@check@eq\@gobbletwo% to shut down command check warnings
\usepackage{index}
\let\@check@eq\vmsta@sv@check@eq
\newindex{default}{idx}{ind}{Raw Index}
%% final settings
\ifdefined\HCode
    \bgroup
        \catcode`#=12\relax
        \catcode`&=6\relax
        \gdef\startlocaldefs{%
            \catcode`#=12\relax
            \makeatletter
            \@startlocaldefs
            }%
        \gdef\@startlocaldefs@toks{}%
        \long\gdef\@startlocaldefs&1\endlocaldefs{%
            \long\xdef\@startlocaldefs@toks{\detokenize{&1}}%
            \makeatother
            \catcode`#=6\relax
            }%
    \egroup
    \g@addto@macro\document{%
        \makeatletter\expandafter\scantokens\expandafter{\@startlocaldefs@toks}\makeatother
        }%
\fi
\def\vmsta@final@settings{%
    \check@localdefs@status
    \flushbottom
    \frenchspacing
    \pagestyle{headings}%
    }
\AtBeginDocument{\vmsta@final@settings}
\endinput
%%
%% End of file `vmsta2.cls'.
