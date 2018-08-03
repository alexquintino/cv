\ProvidesClass{amsquintino-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{666666}
\definecolor{black}{HTML}{2A363B}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{black}
  \colorlet{orange}{black}
  \colorlet{purple}{black}
  \colorlet{red}{black}
  \colorlet{blue}{black}
  \colorlet{fillheader}{white}
  \colorlet{header}{black}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{black}
\colorlet{headercolor}{black}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont[]{Raleway}
\newfontfamily\thinfont[]{Raleway Thin}
\newfontfamily\headingfont[]{Raleway Bold}
\newfontfamily\iconfont[Color=textcolor]{Font Awesome 5 Free Solid}
\newfontfamily\brandsfont[Color=textcolor]{Font Awesome 5 Brands}

\defaultfontfeatures{Mapping=tex-text, Numbers=Lining}
\setmainfont[Mapping=tex-text, Color=textcolor]{Raleway Light}

\setmathfont{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{1.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}
\RequirePackage{tabularx}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{0.5\parskip}
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%
\usepackage{enumitem}
\def\labelitemi{{\scriptsize\iconfont\symbol{"F054}}}

\setlength{\tabcolsep}{4pt}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newenvironment{experience}
  {\tabularx{\textwidth}{ll@{\extracolsep{\fill}}r}}
  {\endtabularx}

\newcommand{\experienceentry}[6]{
    {\small#1} &
    {\large\textbf{#3}} &
    {\footnotesize\addfontfeature{Color=lightgray} #4} \\
    {\small#2} &
    \multicolumn{2}{X}{
      #5 \vspace{\parsep}
      #6} \\[\parsep]
    }

\newenvironment{education}
  {\tabularx{\textwidth}{ll@{\extracolsep{\fill}}}}
  {\endtabularx}

\newcommand{\educationentry}[4]{
    #1 &
    {\large\textbf{#3}} \\
    #2 & {\footnotesize\addfontfeature{Color=lightgray} #4} \\[\parsep]}



%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.1}(1, 3.15)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=1.3cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
