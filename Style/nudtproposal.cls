%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Version Information ********************************
%%
%% Copyright (C) Hanlin Tan <hanlin_tan@nudt.edu.cn> 
%% This is free software: you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{nudtproposal}
  [2014/10/01 v1.0 nudtproposal
   document class]
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Declare Options **************************************
%%
%% end-user parameters, each option is declared by one declare option command
\newif\ifNUDT@versioninfo \NUDT@versioninfofalse
\DeclareOption{draftversion}{% draft information reminder
  \NUDT@versioninfotrue%
}
\newif\ifNUDT@singlesided \NUDT@singlesidedfalse
\DeclareOption{singlesided}{% enable single-sided printing
  \NUDT@singlesidedtrue%
}
\newif\ifNUDT@doublesided \NUDT@doublesidedfalse
\DeclareOption{doublesided}{% enable double-sided printing
  \NUDT@doublesidedtrue%
}
\newif\ifNUDT@printcopy \NUDT@printcopyfalse
\DeclareOption{printcopy}{% enable print copy layout
  \NUDT@doublesidedtrue% auto enable double-sided style
  \NUDT@printcopytrue%
}
\DeclareOption*{% handle non-implemented options
  \PassOptionsToClass{\CurrentOption}{ctexart}%
}
%% terminates all options processing
\ProcessOptions\relax
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Loadclass Infomation *********************************
%%
\ifNUDT@doublesided% if double-sided printing enabled
  \LoadClass[UTF8,a4paper,twoside,fntef,12pt]{ctexart}
\else% if double-sided printing isn't enabled
  \LoadClass[UTF8,a4paper,oneside,fntef,12pt]{ctexart}
\fi
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Package Infomation *********************************
%%
%% color packages
\RequirePackage[usenames,dvipsnames,table]{xcolor}%
%% math packages
\RequirePackage{amsmath,amssymb,amstext}
\RequirePackage[includeheadfoot]{geometry}
%%%%% --------------------------------------------------------------------------------
%%
%%%%************************ Load Class Configuretion ********************************
%%
\AtEndOfPackage{%class cfg loaded after package, makes commands at preamble take effect
  \makeatletter
  \InputIfFileExists{Style/nudtproposal.cfg}{}{}
  \makeatother
}

%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* Page Layout **************************************%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{top=27mm,bottom=25.4mm,left=30mm,right=30mm}
\geometry{headheight=7.7mm,headsep=4.3mm,footskip=7.9mm}
%% specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%% line spacing
\renewcommand{\baselinestretch}{1.4} % line space setting
\raggedbottom % prevent adding vertical white space in strange places
%% default pagestyle is page number at bottom without headers and footers
%\usepackage{titlesec}   %设置页眉页脚的宏包
%\newpagestyle{front}{            
%	\sethead{}{}{}     %设置页眉
%	\setfoot{}{}{}      %设置页脚，可以在页脚添加 \thepage  显示页数
%	\headrule                                      % 添加页眉的下划线
%	\footrule                                       %添加页脚的下划线
%}
\pagestyle{plain}

%%%
\usepackage{enumitem}
\AddEnumerateCounter{\chinese}{\chinese}{}

%%%%% --------------------------------------------------------------------------------
%%
%%%%********************* Some Style Control Commands ********************************
%%
%% redefine cleardoublepage to empty pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}%
\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%% underline
\newcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}
\def\NUDT@underline[#1]#2{%
    \CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\NUDTunderline{\@ifnextchar[\NUDT@underline\CJKunderline}
%%%%% --------------------------------------------------------------------------------
% ttf字体 (Windows)
\newcommand{\installttf}{
	%%%%   Thesis Fonts
	\setmainfont{Times New Roman}
	\setsansfont{Arial}
	\setmonofont{Courier New}
	%%%% Using Office Family Fonts
	\setCJKmainfont{KaiTi}
	\setCJKsansfont{SimHei} % Hei
	\setCJKmonofont{FangSong} % Fangsong
	%%%% alias
	\setCJKfamilyfont{song}{SimSun}
	\setCJKfamilyfont{hei}{SimHei}
	\setCJKfamilyfont{fs}{FangSong} % fang-song
	\setCJKfamilyfont{kai}{KaiTi} % Kai
	\setCJKfamilyfont{times}{Times New Roman} % times
}
\installttf

\newcommand{\cusong}{\bfseries}
\newcommand{\song}{\CJKfamily{song}}     % 宋体
\newcommand{\fs}{\CJKfamily{fs}}         % 仿宋体
\newcommand{\kai}{\CJKfamily{kai}}       % 楷体
\newcommand{\hei}{\CJKfamily{hei}}       % 黑体
\newcommand{\timesnr}{\CJKfamily{times}}   % times new roman
\def\songti{\song}
\def\fangsong{\fs}
\def\kaishu{\kai}
\def\heiti{\hei}
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
	\setlength{\thu@linespace}{#2*\real{#1}}%
	\fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
	\expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
		\thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}
%%%%********************** Chinese Titlepage Items ***********************************
%%
\newcommand\schoollogo[2]{\def\NUDT@value@schoollogo{\includegraphics[#1]{#2}}}
\newcommand\schooltext[2]{\def\NUDT@value@schooltext{\includegraphics[#1]{#2}}}

\newcommand\nudttitle[2]{%
	\def\NUDT@value@title{#1}
	\def\NUDT@value@sectitle{#2}
}

\renewcommand\title[2][\NUDT@value@title]{%
 % \def\NUDT@value@sectitle{#3}	
  \def\NUDT@value@title{#2}
  %\def\NUDT@value@titlemark{\MakeUppercase{#1}}}
  \def\NUDT@value@titlemark{#1}}
\def\@title{\NUDT@value@titlemark}
% 开题报告类型
\newcommand\proposaltype[1]{%	
	\ifstrequal{#1}{doctor}{	\def\NUDT@value@proposall{\NUDTunderline{博士}研究生学位论文}	\def\NUDT@value@proposal{博士研究生学位论文}}{\def\NUDT@value@proposall{\NUDTunderline{硕士}研究生学位论文}	\def\NUDT@value@proposal{硕士研究生学位论文}}
}
% 是否启用目录
\newcommand{\enabletableofcontents}[1]{
    \ifstrequal{#1}{yes}{	\def\NUDT@value@tableofcontents{\tableofcontents}	}{\def\NUDT@value@tableofcontents{}}
}

\newcommand\classification[1]{\def\NUDT@value@classification{#1}}
\newcommand\proposalnumber[1]{\def\NUDT@value@proposalnumber{#1}}

\newcommand\authorid[1]{\def\NUDT@value@authorid{#1}}
\renewcommand\author[1]{\def\NUDT@value@author{#1}}
\newcommand\advisor[1]{\def\NUDT@value@advisor{#1}}
\newcommand\advisortitle[1]{\def\NUDT@value@advisortitle{#1}}
\newcommand\degree[1]{\def\NUDT@value@degree{#1}}
\newcommand\degreetype[1]{\def\NUDT@value@degreetype{#1}}
\newcommand\major[1]{\def\NUDT@value@major{#1}}
\newcommand\field[1]{\def\NUDT@value@field{#1}}
\newcommand\institute[1]{\def\NUDT@value@institute{#1}}
\newcommand\chinesedate[1]{\def\NUDT@value@chinesedate{#1}}
\newcommand\formdate[1]{\def\NUDT@value@formdate{#1}}

%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Make Titlepage ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  
  {
   \zihao{4}\mdseries\heiti
   
    \NUDT@value@schoollogo \hspace{240pt}
    
    \vspace{-65pt}

   \begin{tabular}{c c c}
   	\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad& \NUDT@label@classification      &   {\mdseries\fangsong \NUDT@value@classification}     \\
   	\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad\quad& \NUDT@label@proposalnumber &   {\mdseries\fangsong \NUDT@value@proposalnumber} \\                  
   \end{tabular}
  }

    \vspace{15pt}

   \begin{center}
    \zihao{3}\bfseries\heiti
    \NUDT@value@schooltext
    
    \vspace*{13 pt}
   % \begin{tabular}{c}
    {\fontsize{28}{12}\selectfont \mdseries \NUDT@value@proposall} \\
     %\vspace*{20pt}
    {\fontsize{28}{12}\selectfont \mdseries 开题报告}
   % \end{tabular}

    \vspace*{40pt}

    \def\tabcolsep{1pt}
    \def\arraystretch{1.2}
    %\hskip -15pt
    \begin{tabular}{lc}
      \NUDT@label@title &  {\mdseries\fangsong \NUDTunderline[295pt]{\NUDT@value@title}} \\  &  {\mdseries\fangsong \NUDTunderline[295pt]{\NUDT@value@sectitle}}  \\
      { \NUDT@label@authorid} & \NUDTunderline[113pt]{ \zihao{-3}\mdseries\fangsong \NUDT@value@authorid}\NUDT@label@author\NUDTunderline[113pt]{\mdseries\fangsong  \NUDT@value@author}
    \\
       \NUDT@label@major &  \NUDTunderline[295pt]{\mdseries\fangsong \NUDT@value@major}
     \\
         \NUDT@label@field &  \NUDTunderline[295pt]{\mdseries\fangsong  \NUDT@value@field}
     \\
      \NUDT@label@advisor & \NUDTunderline[113pt]{\mdseries\fangsong  \NUDT@value@advisor}\NUDT@label@advisortitle\NUDTunderline[113pt]{\mdseries\fangsong  \NUDT@value@advisortitle}
    \\
      \NUDT@label@institute & \NUDTunderline[295pt]{\mdseries\fangsong  \NUDT@value@institute}
    \\
      \NUDT@label@date & \NUDTunderline[295pt]{\mdseries\fangsong  \NUDT@value@chinesedate}
    \end{tabular}

    \vspace*{40pt}

 \begin{tabular}{p{400pt}<{\centering}}
    {\mdseries \NUDT@label@mark}  \\
    {\mdseries \NUDT@value@formdate}
 \end{tabular}
    
  \end{center}

  \clearpage

  %%%% 说明页
  \thispagestyle{empty}
  \begin{center}
  	{\heiti \zihao{2} 说 \qquad 明}
  \end{center}
  	{\songti 
  	\begin{enumerate}[label={\chinese*、},labelsep=0pt]
	\addtolength{\itemsep}{-.5\baselineskip}%缩小条目之间的间距
  		\item 开题报告应按下述要求打印后装订成册：
  		\begin{enumerate}[label={\arabic*.},labelsep=0pt]
		\addtolength{\itemsep}{-.3\baselineskip}%缩小条目之间的间距，下面类似
  			\item 	使用A4白纸，双面打印；
  			\item 	封面中填写内容使用小3号仿宋字体；
  			\item 	表中填写内容使用5号楷体字体。
  		\end{enumerate}
  		\item 封面中的编号由学院填写，采用八位数编码，前四位为审批日期，精确到年月即可，第五位为院别，后三位为审批流水号（按年）。如15016100，为6院15年审批的第100位开题申请者，审批时间为15年1月份。院别代码与编制序列一致，海洋科学与工程研究院代码为0。
  		\item 开题报告表中学员填写的内容包括学位论文选题的立论依据、文献综述、研究内容、研究条件、学位论文工作计划、主要参考文献等，指导教师认可学员开题报告内容后，对学员学位论文选题价值、对国内/外研究现状的了解情况、研究内容、研究方案等方面予以评价。
  		\item 开题报告评议小组一般由3-5名具有正高级专业技术职务的专家（包括导师）组成，其中一名为跨一级学科的专家。
		\item 若开题报告获得通过，应根据评议小组意见对开题报告进行修改，并在开题报告会后两周内，将评议表和修订后开题报告纸质版原件交学院备案；若开题报告未获得通过，则填报延期开题申请，由原开题报告评议小组重新组织开题报告会。
	\end{enumerate}
 
    }
   \clearpage
  
  \if@twoside
    \thispagestyle{empty}
    \ifNUDT@versioninfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
    \fi
    \cleardoublepage
  \else
    \ifNUDT@versioninfo
      \thispagestyle{empty}
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        Draft Version (\today)
      \end{footnotesize}
      \cleardoublepage
    \fi
  \fi
  
  %%
  %%% Generate Table of Contents
  %%
  \pagenumbering{roman} % restart numbering page using roman style 目录页码
 % \tableofcontents % 控制启用目录
  \NUDT@value@tableofcontents
  \clearpage
  
  % 设置正文页眉
  \pagestyle{fancy}
  \lhead{} 
  \chead{ \songti 国防科技大学研究生学位论文开题报告 \vspace*{-5pt} \\} % center header
  \rhead{} % empty right header
  \cfoot{\footnotesize\thepage}
}

%%%%     设置字体
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.1pt
\usepackage{fontspec}
\usepackage{indentfirst}
\usepackage{zhspacing}

%%%%% --------------------------------------------------------------------------------
\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------
