% kuthesis v2.7
%
% By Paul E. Johnson <pauljohn@ku.edu>
% Adapted from the Oxford university LaTeX cls By 
% Keith A. Gillow <gillow@maths.ox.ac.uk>
% and the original kuthesis.cls by Lon
% Version 1.0 released 07/21/2011

% Version 2 changes: 07/17/2012
% Paul Johnson. Revision: print dates when included in document.
% Document should have these lines in preamble:
%\@printd@testrue
%\datedefended{May 32, 2012}
%\dateapproved{July 25, 2012}
%
% Version 2.1 changes: 05/20/2013
% Paul Johnson & Jared Harpole. Revisions: 1) delete
% reference to the Graduate School, which no longer exists, and
% re-set arabic page numbers so they begin at 1 after the front matter.
%
% Version 2.2 changes: 10/20/2015
% Paul E. Johnson
% Redesign of committee member names and roles. Goes 
% now to 7 committee members.

% Version 2.3 changes: 03/28/2016
% Paul E. Johnson
% Section font smaller, complies
% now to 7 committee members.

% Version 2.4 changes: 12/20/2016
% Paul E. Johnson
% Change section size to \normalsize
% Insert Chapter size reducer stanza

% Version 2.6 changes: 03/22/2017
% Paul E. Johnson
% Amber Roberts-Graham suggests
% Heading \Large
% Section and Subsection: \large
% Change subsubsection size to \normalsize
% Insert Chapter size reducer stanza

% Version 2.6.1 changes: 04/13/2017
% Paul E. Johnson
% Correct typographical error in subsection environment.
% Correct error in page one paragraph

% Version 2.7 changes: 03/31/2018
% Paul E. Johnson
% Incorporate suggestions from Amber Roberts-Graham of
% KU Office of the Graduate Dean. Use suggestions from
% https://tex.stackexchange.com/questions/423956/convert-macro-from-preamble-into-a-cls-file

%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kuthesis}[2018/03/31 v2.7 KU thesis class]
%-------------------------- initial code -----------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[letterpaper]{report}
% As an alternative to the above could use next line for twosided output
%\LoadClass[letterpaper,twoside,openright]{report}

\raggedbottom

%% PACKAGE REQUIREMENTS %%

%% Required to set margins
\RequirePackage{geometry}

%% Use listings package for "code inserts" and "program output" and such.
%% This is strongly preferred to the Verbatim class. And to stop users
%% from running text into margin, we set the default so that long
%% lines are broken. Users can revise inside their documents, of course.
\RequirePackage{listings}
\lstset{
     breaklines=true,  % sets automatic line breaking
     breakindent=2em,
     breakatwhitespace=true,  % sets if automatic breaks should
     breakautoindent=true
}
%% Could get more aggressive on settings, such as:
%%[basicstyle={\ttfamily}]

%% Section font should not be so large, change Large to large
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}


\renewcommand{\@makechapterhead}[1]{%
    \vspace*{30\p@}%
    {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \Large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 10\p@
    \fi
    \interlinepenalty\@M
    \Large \bfseries #1\par
    \vspace{20pt}%
   }}
\renewcommand{\@makeschapterhead}[1]{%
    \vspace*{30\p@}%
    {\parindent \z@ \centering
    \normalfont
    \interlinepenalty\@M
    \Large \bfseries #1\par\nobreak
    \vspace{10pt}%
  }}


%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the thesis is submitted 
%\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
%\def\degree#1{\gdef\@degree{#1}}
% The name of your Oxford college (e.g. Christ Church, Pembroke)
%\def\college#1{\gdef\@college{#1}}



\def\degreetitle#1{\gdef\@degreetitle{#1}}
\def\papertype#1{\gdef\@papertype{#1}}

\def\dept#1{\gdef\@dept{#1}}

\def\@committeea{\@latex@warning{No committee information given}}
\def\committee#1#2#3#4#5#6#7{
\renewcommand\@committeea{#1}
\newcommand\@committeeb{#2}
\newcommand\@committeec{#3}
\newcommand{\committeed}[1]{\def\@committeed{#4}}
\committeed{}
\newcommand{\committeee}[1]{\def\@committeee{#5}}
\committeee{}
\newcommand{\committeef}[1]{\def\@committeef{#6}}
\committeef{}
\newcommand{\committeeg}[1]{\def\@committeeg{#7}}
\committeeg{}
}

\def\@rolea{\@latex@warning{No role information given}}
\def\role#1#2#3#4#5#6#7{
\renewcommand\@rolea{#1}
\newcommand{\roleb}[1]{\def\@roleb{#2}}
\roleb{}
\newcommand{\rolec}[1]{\def\@rolec{#3}}
\rolec{}
\newcommand{\roled}[1]{\def\@roled{#4}}
\roled{}
\newcommand{\rolee}[1]{\def\@rolee{#5}}
\rolee{}
\newcommand{\rolef}[1]{\def\@rolef{#6}}
\rolef{}
\newcommand{\roleg}[1]{\def\@roleg{#7}}
\roleg{}
}

% priorcreds adaptation 20180328%
\def\@priorcreda{\@latex@warning{No prior credential information given}}
\def\@priorcreds@list{} % initialize
\def\priorcreds#{\@priorcreds} % the trailing # requires \priorcreds to be followed by {
\def\@priorcreds#1{\def\@priorcreda{{#1}}\@priorcreds@go}
\def\@priorcreds@go{\@ifnextchar\bgroup{\@priorcreds@add}{}}
\def\@priorcreds@add#1{%
  \ifx\@priorcreds@list\@empty
    \g@addto@macro\@priorcreds@list{{#1}}%
  \else
    \g@addto@macro\@priorcreds@list{,{#1}}%
  \fi
  \@priorcreds@go
}


\newcommand\@priorcredshow{%
  %\end{center}
  \par{\small
  \@priorcreda % this always exists
  \@for\next:=\@priorcreds@list\do{%
    \par\vspace{0.24em}%
    \next
  \par}}%
  % \end{center}
}
%% end prior creds


\newcommand\@committeesignatures{
\parbox{3.5in}{
\begin{center}
\vskip 1.5em
\hrulefill \\
{\small \@committeea}, \@rolea\\
\vskip 1.5em
\hrulefill \\
{\small \@committeeb}\ifx\@roleb\@empty \relax \else, \@roleb\fi\\
\vskip 1.5em
\hrulefill \\
{\small \@committeec}\ifx\@rolec\@empty \relax \else, \@rolec\fi\\
\vskip 1.5em
\ifx\@committeed\@empty
\relax
\else
\hrulefill \\
{\small \@committeed}\ifx\@roled\@empty \relax \else, \@roled\fi\\
\fi% 
\ifx\@committeee\@empty
\relax
\else
\vskip 1.5em
\hrulefill \\
{\small \@committeee}\ifx\@rolee\@empty \relax \else, \@rolee\fi\\
\fi% 
\ifx\@committeef\@empty
\relax
\else
\vskip 1.5em
\hrulefill \\
{\small \@committeef}\ifx\@rolef\@empty \relax \else, \@rolef\fi\\
\fi% 
\ifx\@committeeg\@empty
\relax
\else
\vskip 1.5em
\hrulefill \\
{\small \@committeeg}\ifx\@roleg\@empty \relax \else, \@roleg\fi\\
\fi% 

%http://physics.wm.edu/~norman/latexhints/conditional_macros.html
\end{center}
}
}

%%%%%%%

%%%%%%%

\newif\if@printd@tes
\if@printd@tes
\def\datedefended#1{\gdef\d@tedef{#1}}
\def\dateapproved#1{\gdef\d@teappr{#1}}
\else
\def\datedefended#1{\def\d@tedef{#1}}
\def\dateapproved#1{\def\d@teappr{#1}}
\fi

\newcommand\d@ted@fended{
\parbox{2.5in}{
\begin{center}
\if@printd@tes {\small \d@tedef}\vskip -1em\else\vskip0.5em\fi
\hrulefill
\end{center}
}}
\newcommand\d@te@ppr{
\parbox{2.5in}{
\begin{center}
\if@printd@tes {\small \d@teappr}\vskip -1em\else\vskip0.5em\fi
\hrulefill
\end{center}
}}



%
%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}

%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}

%define title page layout
\renewcommand{\maketitle} {%
\begin{alwayssingle}
  \begin{singlespace} 
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  \null\vfill
  \begin{center}
   {\Large {\bfseries {\@title}} \par}
   \vskip 1.5em%
    {{\small \copyright \the\year} \par}
    \vskip 0.5em%
    {{\Large \@author} \par}
    \vskip 0.5em%
   \@priorcredshow
\vfill

    {{Submitted to the graduate degree program in {\@dept}  and the
        Graduate Faculty of the University of Kansas in partial
        fulfillment of the requirements for the degree of {\@degreetitle}.\par}}
 \par
  \end{center}
  \begin{flushright}
  \makebox[2in]{Committee members} \@committeesignatures  \\%
  \vskip 1.5em\par%
  Date defended:\d@ted@fended
  \end{flushright}
  \vfill
  \null
\end{singlespace}
  \newpage\thispagestyle{plain}
  \begin{singlespace}
  \vfill
  \setcounter{page}{2}
  \begin{center}
    The {\@papertype} Committee for {\@author} certifies \par
    that this is the approved version of the following \MakeLowercase{\@papertype} : \par
    \vfill
    {\@title} \par
    \vfill
  \end{center}
  \begin{flushright}
    \parbox{2.75in} {
      \hrulefill \\
        {\centering \small \@committeea, \@rolea} \\
      }
  \end{flushright}
    
  \vskip 3.5em\par
  \begin{center}   
    Date approved: \d@te@ppr
  \end{center}
  %%%copy clean-up code from original report.cls
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\@committee1\relax
  \global\let\@committee2\relax
  \global\let\@committee3\relax
  \global\let\@committee4\relax
  \global\let\@committee5\relax
  \global\let\@committee6\relax
  \global\let\@committee7\relax
  \global\let\@role1\relax
  \global\let\@role2\relax
  \global\let\@role3\relax
  \global\let\@role4\relax
  \global\let\@role5\relax
  \global\let\@role6\relax
  \global\let\@role7\relax
  \global\let\@priorcreds\relax
  \global\let\@priorcredshow\relax
\end{singlespace}
\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% STATEMENT OF ORIGINALITY (AS SUGGESTED BY GSW)
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

\newenvironment{originality}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The originalitylong environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself does not appears in a quote environment so you can 
% get more in.

\newenvironment{originalitylong}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract} {\begin{alwayssingle} \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractlong} {\begin{alwayssingle} \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

% See: https://tex.stackexchange.com/questions/309072/how-to-add-abstract-for-selected-chapters-in-my-thesis
\newenvironment{chapterabstract}
{
    \begin{center}%
    \vspace*{0.5cm}
      {\large \bfseries Abstract \vspace{-.5em}\vspace{0pt}}
    \end{center}
    \list{}{%
    \setlength{\leftmargin}{5mm}% <---------- CHANGE HERE
    \setlength{\rightmargin}{\leftmargin}%
  }%
  \item\relax
}

% %The abstractseparate environment is for running of a page with the abstract
% %on including title and author etc as required to be handed in separately

% \newenvironment{abstractseparate} {\begin{alwayssingle} \thispagestyle{empty}
%   \vspace*{-1in}
%  \begin{center}
%     { \Large {\bfseries {\@title}} \par}
%     {{\large \vspace*{1ex} \@author} \par}
% {\large \vspace*{1ex}
%     {{\@college} \par}
%     {University of Oxford \par}
% \vspace*{1ex}
%     {{\it \submittedtext} \par}
%     {\it {\@degree} \par}
% \vspace*{2ex}
%     {\@degreedate}}
%   \end{center}}
% {\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\arabic{page}}}
