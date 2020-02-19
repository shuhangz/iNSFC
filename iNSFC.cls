% -------------------------------------------------
% iNSFC - LaTeX template for NSFC.
% Written by Yimian Dai, 
% Modified by Yang Luo, Jan 28 2020.
% Email: yluo@hit.edu.cn
%
% Thanks Mingming Chen and Yimian Dai for their pioneer works. 
% https://github.com/YimianDai/iNSFC
% -------------------------------------------------


%%%%----标识节：宣告自身类或宏包，并给出简要描述性信息----%%%%

% 依赖LaTeX2e内核特性
\NeedsTeXFormat{LaTeX2e}[1994/06/01]
% 文档类文件的标识，格式\ProvidesClass{<class-name>}[<date> <other info>]
\ProvidesClass{iNSFC}[2020/01/28 v2.0 The LaTeX class for NSFC]

%%%%----使用类与宏包----%%%%


% 加载CTeX宏集提供ctexart类，格式\LoadClass[<option>]{<class-name>}[<date>]
% a4paper: 页面大小为A4
% fancyhdr: 使用fancyhdr宏包来配置页眉页脚风格
% zihao: 设置正文字号为小四
% UTF8: 编写文档时使用的中文编码格式，建议使用UTF8
% punct: 标点处理格式，<quanjiao|banjaio|kaiming|CCT|plain>，默认为quanjiao
% linespread: 设置行距倍数（实际行距/基本行距），对于ctexart，基本行距为1.3倍字号， 而NSFC模板行间距为22pt，经过换算 22/12/1.3=1.41025641（小四为12pt），要的就是精度！哈哈哈！
% heading: 由于修改文档章节标题格式
\LoadClass[a4paper, UTF8, punct = quanjiao, linespread = 1.41025641, zihao = -4, heading = true]{ctexart}
%加载geometry宏包，设置页面大小a4paper，设置左边距、右边距、上边距和下边距分别为3.2cm, 3.2cm, 2.54cm, 2.54cm
\RequirePackage[a4paper, left = 3.2cm, right = 3.2cm, top = 2.54cm, bottom = 2.54cm]{geometry}
%加载xcolor或color宏包，用来定义NSFC模板中的颜色
\RequirePackage{xcolor}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{graphicx} 
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{times}
\RequirePackage[subrefformat=parens,labelformat=parens]{subfig} %
\RequirePackage{booktabs} % for \toprule \midrule \bottomrule \cmidrule
\RequirePackage{cleveref}
\crefformat{table}{表~#2#1#3}
\crefformat{figure}{图~#2#1#3}
\crefformat{equation}{式~（#2#1#3）}
\RequirePackage{enumitem}
% \setenumerate[1]{itemsep = 0pt, parsep = 0pt, topsep = 2bp}
\setlist[enumerate]{itemsep = 0pt, parsep = 0pt, topsep = 2bp}
% \setitemize[1]{itemsep = 0pt, parsep = 0pt, topsep = 2bp}
\setlist[itemize]{itemsep = 0pt, parsep = 0pt, topsep = 2bp}
\RequirePackage{fontspec}

% \RequirePackage{minted}   % For syntax highlighting
% \usemintedstyle{friendly}
\RequirePackage{setspace} 
%加载caption宏包，设置图标标题样式
\RequirePackage{caption}
%加载natbib，设置参考文献引用格式
\RequirePackage[square,numbers,sort&compress]{natbib}   % For Reference
\newcommand{\citess}[1]{\textsuperscript{\cite{#1}}}
\setlength{\bibsep}{1pt plus 0.3ex}
%加载标题设置宏包
\RequirePackage{titlesec}
%加载文献引用样式
\RequirePackage{gbt7714}
%定义行内引用\inlinecite
\newcommand{\inlinecite}[1]{{\setcitestyle{square,numbers}\cite{#1}}}

%%%%----声明选项节：声明并处理可选项----%%%%
%声明选项的格式：\DeclareOption{<option>}{<code>}
\newif\if@kai \@kaitrue
\DeclareOption{kaiti}{\@kaitrue}
\DeclareOption{songti}{\@kaifalse}

 
%\DeclareOption{AutoFakeBold}{%
%}
%处理iNSFC未声明的选项
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{ctexart}%
%  \PackageWarning{iNSFC}{Unknown option '\CurrentOption'}%
}
%执行默认选项
\ExecuteOptions{AutoFakeBold, kaiti}
%执行每个指定（且已声明）的选项的<code>部分
\ProcessOptions\relax

%%%%----更多声明节：宣告自身类或宏包，并给出简要描述性信息----%%%%

%设置页面风格为empty，没有页眉页脚
\pagestyle{empty}
%定义NSFC模板中使用的蓝色，从Word模板中可知其rgb值为{0, 112, 192}，利用color或者xcolor宏包声明NsfcBlue
\definecolor{NsfcBlue}{RGB}{0, 112, 192}

%设置英文字体为新罗马字体
\setmainfont{Times New Roman}
%AutoFakeBold: 使用伪粗体，由于LaTeX下楷体没有Bold形式，因此采用伪粗体来上实现粗体效果，传递给楷体
\setCJKmainfont[AutoFakeBold]{KaiTi}

%通过更新\refname设置参考文献标题样式
\renewcommand\refname{
  \textcolor{black}{\hskip 2pt \zihao{-4}\songti{参考文献}}
}
%声明标题字体命令，格式\DeclareCaptionFont{<字体名>}{<字体命令>}
\DeclareCaptionFont{capfont}{\zihao{-4}\selectfont} % Caption font
\DeclareCaptionFont{subfont}{\zihao{5}\selectfont} % Sub-caption font
%设置相应的浮动体图标标题格式
\captionsetup{font = capfont}
\captionsetup[subfigure]{font = subfont}
\captionsetup[figure]{labelsep=space} % 空格 space；点 period；冒号 colon
\captionsetup[table]{labelsep=space}  % 空格 space；点 period；冒号 colon
%设置subsubsection格式
\renewcommand{\thesubsubsection}{(\arabic{subsubsection})} % subsubsection下标号显示为 (1) 
\titleformat{\subsubsection}[block]{\bf\hspace{3em}}{\thesubsubsection}{1em}{} %subsubsection格式
%设置subsection格式
\titleformat{\subsection}[block]{\bf\songti}{\thesubsection}{1em}{} %subsection格式


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cite mark [1] on the top right
% \newcommand{\citetop}[1]{\textsuperscript{\cite{#1}}}

% enumitem command


% \setlength{\parskip}{0.5\baselineskip}

% setspace command
% \setstretch{1.5} % 22 bp / 14 pt = 1.571

% For bule regular 14 bp NSFC words 
\newcommand{\NsfcNote}[1]{\textcolor{NsfcBlue}{{\zihao{4}{{#1}}}}}
\newcommand{\alert}[1]{\textcolor{NsfcBlue}{{\zihao{4}{{\bfseries #1}}}}}

% For the chapter name like （一）立项依据与研究内容（4000-8000字）
\newcommand{\NsfcChapter}[2]{ 
  \begingroup
    \setcounter{section}{0}  
    % \setlength{\parskip}{0.5\baselineskip}
    % For xelatex
    \setlength{\baselineskip}{22bp}
    \indent {\bfseries \NsfcNote{#1}}\NsfcNote{#2} \vspace{9bp}%
    % For pdflatex
    % \indent {\bfseries \NsfcNote{#1}}\NsfcNote{#2} %
  \endgroup
}

% For the section name like 2．项目的研究内容、研究目标，以及拟解决的关键科学问题（此部分为重点阐述内容）；

\newcommand{\NsfcSection}[2]{ 
	\addtocounter{section}{1}  %section计数器+1
	%  \setcounter{section}{#1}
	\setcounter{subsection}{0}
	% For xelatex
	\indent \NsfcNote{\thesection．}{\bfseries\NsfcNote{#1}}\NsfcNote{#2}%
	% For pdflatex
	% \indent \NsfcNote{#1．}{\bfseries\NsfcNote{#2}}\NsfcNote{#3} %
}

\newcommand{\qianyan}{%
	\begin{center}
		{\zihao{3} \textbf{报告正文}   \vspace{-1ex}}
	\end{center}
 
{\zihao{4} 参照以下提纲撰写，要求内容翔实、清晰，层次分明，标题突出。}\alert{请勿删除或改动下述提纲标题及括号中的文字。\vspace{9bp}}
}

\newcommand{\insertref}[1]{%
	\begin{spacing}{1.3} % 行距
		\zihao{5} \songti   
		\bibliographystyle{gbt7714-nsfc}
		\bibliography{#1}  
		\vspace{11bp}
	\end{spacing}
}

\newenvironment{bibenv}{\begin{spacing}{1.3} % 行距
		\zihao{5} \songti}{\vspace{11bp}
	\end{spacing}}

% Decrease space above and below equations
\setlength{\abovedisplayskip}{0pt}
\setlength{\belowdisplayskip}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%