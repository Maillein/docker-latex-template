\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{report}[2022/09/22 report]

\LoadClass[a4paper,11pt, uplatex]{jsarticle}

\usepackage{subfiles}
\usepackage{listings}
\usepackage{plistings}
\usepackage{color}
\usepackage[dvipdfmx]{graphicx}
\usepackage{url}
\usepackage{siunitx}
\usepackage{enumerate}
\usepackage{paralist}
\usepackage{amsmath,amssymb}
\usepackage{mathtools}
\usepackage{times}
\usepackage[cache=false, outputdir=out, newfloat]{minted}
\usepackage[hang,small,bf,labelsep=space]{caption}
\usepackage[subrefformat=parens]{subcaption}
\usepackage[dvipdfmx]{hyperref}
\usepackage{pxjahyper}
\usepackage{framed}
\usepackage[dvipdfmx]{pdfpages}
\usepackage[backend=biber,style=ieee]{biblatex}
\usepackage{here}
% \addbibresource{references.bib}
\captionsetup{compatibility=false}

\newcommand{\code}[1]{\texttt{#1}}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{4}

% \renewcommand{\figurename}{\normalsize Fig.}
% \renewcommand{\tablename}{\normalsize Table}

\SetupFloatingEnvironment{listing}{name=コード}
