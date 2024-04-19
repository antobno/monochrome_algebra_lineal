\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{monochrome}[2024/03/14 Una plantilla para mis notas de álgebra lineal]

\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{book}
}

\ProcessOptions\relax

\LoadClass[a4paper, twoside]{book}

\RequirePackage[spanish, es-noshorthands, es-tabla, es-lcroman]{babel}


%------------------------------------------------------------------------------
%	DECLARACIÓN DE FUENTES
%------------------------------------------------------------------------------

\RequirePackage[no-math]{fontspec}

\setmonofont{Source Code Pro Light}[
BoldFont=Source Code Pro,
Scale=MatchLowercase,
]

\setsansfont{Lato Light}[
%Numbers=OldStyle,
BoldFont=Lato Regular,
ItalicFont=Lato Light Italic,
BoldItalicFont=Lato Italic
]

\setmainfont{Lato Light}[
%Numbers=OldStyle,
BoldFont=Lato Bold,
ItalicFont=Lato Light Italic,
BoldItalicFont=Lato Italic
]

\newfontfamily{\titlefont}{Lato Light}[
%Numbers=OldStyle,
BoldFont=Lato Regular,
ItalicFont=Lato Light Italic,
BoldItalicFont=Lato Italic
]

\newfontfamily{\upperNumber}{Lato Light}[
BoldFont=Lato Regular,
ItalicFont=Lato Light Italic,
BoldItalicFont=Lato Italic
]


%------------------------------------------------------------------------------
%	TODOS LOS PAQUETES NECESARIOS PARA EL CORRECTO FUNCIONAMIENTO DEL DOCUMENTO
%------------------------------------------------------------------------------

\RequirePackage{fix-cm}
\RequirePackage[
  compact,
  newparttoc,
  newlinetospace,
]{titlesec}
\RequirePackage{titletoc}
\RequirePackage[strict]{changepage}

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

\RequirePackage[bbgreekl]{mathbbol}
\RequirePackage{amsmath, amsfonts, amssymb, amsthm}
\RequirePackage{bm}
\RequirePackage{stmaryrd}
\RequirePackage{thmtools}
\RequirePackage{mathtools}
\RequirePackage{bookmark}
\RequirePackage{booktabs}
\RequirePackage{calc}
\RequirePackage{caption}
\RequirePackage[inline]{enumitem}
\RequirePackage{tasks}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{floatrow}
\RequirePackage{graphicx}
\RequirePackage{subfig}
\RequirePackage[section]{placeins} % Evita que los flotadores lleguen a las secciones transversales
\RequirePackage{marginnote} % Provides options for margin notes
\RequirePackage{marginfix} % Proporciona opciones para notas al margen
\RequirePackage{sidenotes} % Para usar notas al margen
\RequirePackage{chngcntr} % Restablecer contadores en secciones
\RequirePackage[bottom, symbol*, hang, flushmargin, stable]{footmisc} % Requerido para configurar las notas al pie
\RequirePackage{footnotebackref} % Crea referencias posteriores de las notas al pie de página al texto
\RequirePackage{mdframed}
\RequirePackage{microtype}
\RequirePackage{multicol}
\RequirePackage{ragged2e}
\RequirePackage{verbatim}
\RequirePackage{hyperref}
\RequirePackage{geometry}
\RequirePackage{qrcode}
\RequirePackage{ccicons}
\RequirePackage{emptypage} % Este paquete elimina encabezados y pies de página en páginas vacías entre capítulos. Importante para prólogos, introducción, etc.
\RequirePackage{pdfpages}

\RequirePackage{tikz}
\usetikzlibrary{shapes}
\usetikzlibrary{positioning}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{calendar}
\usetikzlibrary{mindmap}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{calc}
\usetikzlibrary{intersections}
\usetikzlibrary{decorations.pathreplacing}
\usetikzlibrary{matrix}
\usetikzlibrary{backgrounds}
\usetikzlibrary{fit}
\usetikzlibrary{3d}
\usetikzlibrary{patterns,angles,quotes}
\RequirePackage{tikz-3dplot}
\usetikzlibrary{snakes}

\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}
\usetikzlibrary{pgfplots.fillbetween}

\RequirePackage[most]{tcolorbox}
\tcbuselibrary{skins}
\tcbuselibrary{listings,breakable}
\tcbuselibrary{documentation}
\usetikzlibrary{shadings}


\RequirePackage{lipsum} % Genera texto aleatorio, esto sirve para hacer pruebas a la plantilla
%------------------------------------------------------------------------------
%	 UNIDADES DE MEDIDAS Y DIMENSIONES PARA EL DOCUMENTO
%------------------------------------------------------------------------------

\newlength{\hscale}
\newlength{\vscale}
% De forma predeterminada, las escalas están configuradas para funcionar para a4paper
\setlength{\hscale}{1mm}
\setlength{\vscale}{1mm}

\setlength{\parskip}{0.8\baselineskip}
%\setlength{\parindent}{0ex}
\setlength{\headheight}{12.0pt}

% Guardar alguna longitudes como comandos
\newlength{\wholeMargin}
\setlength{\wholeMargin}{\marginparwidth}
\addtolength{\wholeMargin}{\marginparsep}

\newlength{\wholeWidth}
\setlength{\wholeWidth}{\textwidth}
\addtolength{\wholeWidth}{\wholeMargin}

\geometry{
    %showframe,
	a4paper,
    asymmetric,
	ignorefoot,
	ignorehead,
	right=7.7cm,
	left=2cm,
	top=2.5cm,
	bottom=2.5cm,
	footskip=2\baselineskip,
	footnotesep=0mm,
	marginparwidth=5cm,
	marginparsep=7mm,
	headheight=0mm,
}
%\reversemarginpar

\newcommand{\symmetricalPage}{
	\fancyhfoffset[L]{0mm}
	\newgeometry{
		ignorefoot,
		ignorehead,
		left=3cm,
		right=3cm,
		top=3cm,
		bottom=3cm,
		marginparwidth=0cm,
		marginparsep=0mm
	}
}
\newcommand{\TOCPage}{
	\fancyhfoffset[L]{0mm}
	\newgeometry{
		asymmetric,
        ignorefoot,
		ignorehead,
		left=2cm,
		right=6cm,
		top=2cm,
		bottom=2cm,
		marginparwidth=0cm,
		marginparsep=0mm
	}
}
\newcommand{\asymmetricalPage}{
	\restoregeometry
}


%------------------------------------------------------------------------------
%	HYPERVINCULOS, ENLACES, METADATOS, ETC.
%------------------------------------------------------------------------------

\urlstyle{rm}
\hypersetup{
	pdfborder={1 1 0},
	pdfcreator=LaTeX,
    pdftitle={Fundamentos y principios del álgebra lineal},
	pdfauthor={Antonio M. Mendoza},
    pdfsubject={Desde la teoría de espacios vectoriales y sus transformaciones lineales hasta la resolución de sistemas de ecuaciones lineales y la diagonalización de matrices.},
    pdfpagemode=FullScreen,
    %bookmarks=true,
    bookmarksopen=false,
    linktocpage=true,
	colorlinks=true,
	linkcolor=black,
	linktoc=all,
	urlcolor=black,
	citecolor=black,
	filecolor=black,
}


%------------------------------------------------------------------------------
%	MARCADORES
%------------------------------------------------------------------------------

\bookmarksetup{
	open, % Abre todos los marcadores automáticamente
	numbered, % Agregar números de sección a marcadores
	addtohook={%
		\ifnum\bookmarkget{level}=-1 % Personalizar marcadores de partes
			\bookmarksetup{color=black, bold}% Negrita y coloreada
		\fi
		\ifnum\bookmarkget{level}=0 % Personalizar marcadores de capítulos
			\bookmarksetup{bold}% Negrita
		\fi
	}
}


%------------------------------------------------------------------------------
%	ENCABEZADOS
%------------------------------------------------------------------------------

\fancypagestyle{fancy}{
	\renewcommand{\headrulewidth}{0pt}
	\fancyhf{}
	\fancyhfoffset[RO]{\marginparsep + \marginparwidth}
    %\fancyhfoffset[LE]{- 0.05\marginparsep}
    \rhead[{\bfseries\protect\hyperref[toc-contents]{\small\thepage}\hspace{-\marginparwidth -\marginparsep}}]{\small\rightmark}
    \lhead[\small\leftmark]{{\bfseries\protect\hyperref[toc-contents]{\small\thepage}}}
}

\def\chaptermark#1{\markboth{\protect\hyper@linkstart{link}{\@currentHref}{\textbf{\MakeUppercase{\chaptertitlename}~\thechapter} ~#1}\protect\hyper@linkend}{}}
\def\sectionmark#1{\markright{\protect\hyper@linkstart{link}{\@currentHref}{\textbf{SECCIÓN~\thesection} ~\MakeUppercase{#1}}\protect\hyper@linkend}}

\fancypagestyle{plain}{ % Estilo para cuando se especifica un estilo de página simple
	\fancyhead{} % Borrar encabezados
	\renewcommand{\headrulewidth}{0pt} % Eliminar línea de encabezado
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		CAPÍTULO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\newlength{\subtitleRubberWidth}\setlength{\subtitleRubberWidth}{3cm}
%\newlength{\subtitleDefaultPadding}\setlength{\subtitleDefaultPadding}{2mm}
%\newlength{\subtitleRubberHeight}\setlength{\subtitleRubberHeight}{7cm}
\titleformat{\chapter}[block]
{} % format
{\begin{flushleft}%
	\begin{tikzpicture}[remember picture, overlay, inner sep=2mm]
		\node[yshift = 0.5cm, xshift = 0.2cm + \hoffset, right, font=\fontsize{1.2cm}{1.2cm}\selectfont\bfseries] (chapterLabel) {\chaptertitlename};
        \filldraw[black!80] ($(chapterLabel.west)+(-\textwidth,0)$) rectangle (current page.north east);
        \filldraw[white] (chapterLabel.south west) rectangle (chapterLabel.north east);
		\draw[black!80, ultra thick] (chapterLabel.south west) rectangle (chapterLabel.north east);
        \node[font=\fontsize{1cm}{1.2cm}\selectfont\bfseries] at (chapterLabel) {\chaptertitlename};
        \node[white, font=\bfseries, yshift=2.5cm, above of=chapterLabel] {\scalebox{16}{\thechapter\startcontents}};
	\end{tikzpicture}
\end{flushleft}
}
{0pt} % 
{% 
	\blockmargin%
	\begin{adjustwidth}{0mm}{-\wholeMargin}
		\begingroup
        \FlushLeft
		%\chapterFont
        \fontsize{1.5cm}{1.8cm}\selectfont\bfseries%
		\noHyphen%
}[ % 
        \endgroup
	\end{adjustwidth}
	\unblockmargin%
]

\titleformat{name=\chapter, numberless}[block]
{} % 
{}
{0pt} % 
{ % 
	\begin{adjustwidth}{0mm}{-\wholeMargin}
		\FlushLeft
		\begingroup
        \fontsize{1.5cm}{1.8cm}\selectfont\raggedright\bfseries%
		\noHyphen%
	}[ % 
	\endgroup
\end{adjustwidth}
]

\titlespacing*% La estrella hace elimina la sangría
    {\chapter}% Comando para formatear
    {0pt}% Espaciado a la izquierda
    {0.25\textheight}% Espaciado antes del título
    {4ex}% Espaciado después del título
    [0pt]% Margen extra a la derecha


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		LISTAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlist{
  topsep=0mm,
}
\setlist[description]{font=\scshape}
\setlist[enumerate]{font=\bfseries}
\setlist[itemize]{label={$\bullet$}}

\settasks{
    label-format = \bfseries,
    item-indent = 0.94cm,
}


%----------------------------------------------------------------------------------------
%	NOTAS AL PIE, NOTAS AL MARGEN Y NOTAS AL MARGEN
%----------------------------------------------------------------------------------------

\pgfkeys{
	/yMarginDesign/.cd,
	alignment/.code = \RaggedRight,
	emph color/.initial = black,
	text color/.initial = black,
	size/.code = \footnotesize,
	titleFormat/.code = \bfseries\scshape,
	marginparskip/.initial = 3mm,
}

% Para escribir un párrafo en el margen
\DeclareDocumentCommand{\marginElement}{m}{%
	\marginpar{{%
			\pgfkeys{/yMarginDesign/alignment}%
			\pgfkeys{/yMarginDesign/size}%
			\color{\pgfkeysvalueof{/yMarginDesign/text color}}
      \setlist{
        noitemsep,
        left=0mm,
      }%
      #1\par\vspace*{\baselineskip}%
	}}\unskip%
}%

\newcounter{marginnote}

% Para escribir un párrafo en el margen con un número (como nota a pie de página)
\DeclareDocumentCommand{\marginNote}{m}{%
  \stepcounter{marginnote}%
  \hyper@anchor{from-\theHmarginnote}%
  {%
    \bfseries%
    \hyper@link{}{to-\theHmarginnote}{\textsuperscript{\textcolor{\pgfkeysvalueof{/yMarginDesign/emph color}}{\themarginnote}}}%
  }%
	\marginElement{%
	  \hyper@anchor{to-\theHmarginnote}%
	  {%
	    \bfseries%
      \hyper@link{}{from-\theHmarginnote}{\textcolor{\pgfkeysvalueof{/yMarginDesign/emph color}}{\themarginnote.}}~%
	  }%
	  \ignorespaces%
		#1%
	}%
}%

% Escriba un párrafo en el margen exactamente en la posición exacta en la que se llama el comando
\DeclareDocumentCommand{\forcedMarginElement}{m}{%
  \marginnote{{%
    \pgfkeys{/yMarginDesign/alignment}%
    \pgfkeys{/yMarginDesign/size}%
    \color{\pgfkeysvalueof{/yMarginDesign/text color}}
		#1%
  }}%
}

% Escriba un párrafo en el margen exactamente en la posición exacta donde se llama al comando con un número (como nota a pie de página)
\DeclareDocumentCommand{\forcedMarginNote}{m}{%
	\printMarginNoteMark
	\ignorespaces%
	\forcedMarginElement{%
		\sideMark[#1]{\thefootnote}%
		\ignorespaces%
		#1%
	}%
}

\DeclareDocumentCommand{\sideTable}{o m}{%
	\marginpar{%
		\strictpagechecktrue%
		\checkoddpage%
		\ifoddpage%
		\justifying\footnotesize%
		\else%
		\RaggedLeft\footnotesize%
		\fi%
		\@afterindentfalse\@afterheading
		\vspace*{6mm} % Compensa el espacio de la tabla añadido por encima de la primera línea 
		#2
		\captionsetup*[table]{font={footnotesize},hypcap=false}
		\IfValueT{#1}{\captionof{table}{#1}}
	}
}

\DeclareDocumentCommand{\sideFigure}{o m}{%
	\marginElement{%
		\strictpagechecktrue
		\checkoddpage
		\ifoddpage%
		\RaggedRight%
		\else%
		\RaggedLeft%
		\fi%
		\@afterindentfalse\@afterheading%
		#2%
		\captionsetup*[figure]{font={footnotesize},hypcap=false}%
		\IfValueT{#1}{\vspace*{-2mm}\captionof{figure}{#1}}
	}
}

\newcommand{\noHyphen}{%
  \righthyphenmin=62
  \lefthyphenmin=62
}

\DeclareDocumentCommand{\yTitle}{m}{%
  \begingroup%
    \large\scshape\bfseries%
    #1%
  \endgroup%
}

\DeclareDocumentCommand{\printchaptertableofcontents}{}{%
  \marginElement{%
    {%
      %\vspace*{9mm}
      \yTitle{Contenido}\\[2mm]
      \printcontents{c}{1}[1]{\hypersetup{linkcolor=black}}%
    }%
  } 
}

\newcommand{\infoBulle}[1]{
\marginElement{\justify
\textcolor{black}{\vrule width 3pt}\colorbox{white}{
    \parbox[c]{\dimexpr\linewidth-3pt-2\fboxsep-2\fboxrule}{\vspace{1mm}\textbf{\textcolor{black}{\fontfamily{lmr}\selectfont\large i}\qquad\small Nota}\\[1.5mm]
    #1
    }\,\,\,}
}}

\newcommand{\remarkBulle}[1]{
\marginElement{\justify
\textcolor{black}{\vrule width 3pt}\colorbox{white}{
    \parbox[c]{\dimexpr\linewidth-3pt-2\fboxsep-2\fboxrule}{\vspace{1mm}\textbf{Recordatorio}\\[1.5mm]
    #1
    }\,\,\,}
}}

%----------------------------------------------------------------------------------------
%	FLOTADORES: FIGURAS, TABLAS, LISTADOS Y LEYENDAS
%----------------------------------------------------------------------------------------

\DeclareDocumentCommand{\isOddPage}{mm}{%
	\strictpagechecktrue%
	\checkoddpage%
	\ifoddpage%
	#1%
	\else%
	#2%
	\fi%
}

\DeclareCaptionFont{myCaptionFont}{\bfseries}
\DeclareCaptionLabelSeparator{myCaptionLabelSeparator}{\hspace*{1ex}}
\captionsetup{
    labelfont=myCaptionFont,
    %justification=RaggedRight,
    labelsep=myCaptionLabelSeparator,
    %strut=no,%
    %hypcap=true, % Los enlaces apuntan a la parte superior de la figura
    %singlelinecheck=false,%
    %width=\marginparwidth,
    %indention=0pt, % Suprimir la sangría
    %parindent=0pt, % Suprimir el espacio entre los párrafos
}

\DeclareFloatVCode{parskip}{{\vspace{\parskip}}}
\newlength{\twoparskip}
\setlength{\twoparskip}{1.5\parskip}
\DeclareFloatVCode{twoparskip}{{\vspace\twoparskip}}
\DeclareFloatSeparators{marginparsep}{\hspace\marginparsep}

\floatsetup[figure]{
    %precode=twoparskip,
    margins=hangright,
    floatwidth=\textwidth,
    font={normalsize},
    capposition=beside,
    captionskip=0mm,
    capbesideposition={top,right},
    capbesidewidth=sidefil,
    capbesidesep=marginparsep,%
    footposition=caption,
    footskip=0.5\baselineskip,
    footfont={small},
	%postcode=twoparskip,
}

\floatsetup[widefloat]{%
	capposition=bottom,
	captionskip=\baselineskip,
}


%-----------------------------------------------------------------------------
%   TABLA DE CONTENIDOS
%-----------------------------------------------------------------------------

\contentsmargin{0cm}

% Estilo de texto de parte
\titlecontents{part}[0cm]
{\addvspace{20pt}\centering\large\bfseries\color{white}}
{}
{}
{}

\titlecontents{lchapter}[1.4cm] % Sangría
{\addvspace{12pt}\large\bfseries} % Opciones de espaciado y fuente para los capítulos
{\contentslabel[\Large\thecontentslabel]{1cm}} % Número de capítulo
{}
{\normalsize\;\titlerule*[.6pc]{.}\;\thecontentspage} % Número de página

% Estilo de texto de capítulo
\titlecontents{chapter}[1.4cm] % Sangría
{\addvspace{12pt}\large\bfseries} % Opciones de espaciado y fuente para los capítulos
{\contentslabel[\Large\thecontentslabel]{1cm}} % Número de capítulo
{}
{\normalsize\hfill\thecontentspage} % Número de página

% Estilo de texto de sección 
\titlecontents{section}[2.4cm] % Sangría
{\addvspace{1pt}} % Opciones de espaciado y fuente para las secciones
{\contentslabel[\thecontentslabel]{1cm}} % Número de sección
{}
{\normalsize\;\titlerule*[.6pc]{.}\;\thecontentspage} % Número de página
[]

\titlecontents{csection}
  [6mm] % 
  {\addvspace{1.5pt}} % 
  {\contentslabel[\bfseries\thecontentslabel]{6mm}\noHyphen} % 
  {\hspace*{-6mm}\noHyphen} % 
  {\;\titlerule*[.6pc]{.}\;\thecontentspage} % 

% Estilo de texto de subsección 
\titlecontents{subsection}[3.4cm] % Sangría
{\addvspace{1pt}\small} % Opciones de espaciado y fuente para las secciones
{\contentslabel[\thecontentslabel]{1cm}} % Número de subsección
{}
{\ \titlerule*[.8pc]{.}\;\thecontentspage} % Número de página
[]


\DeclareDocumentCommand{\printchaptertableofcontents}{}{%
  \marginElement{%
    {%
      %\vspace*{9mm}
      \yTitle{Contenido}\\[2mm]
      \printcontents{c}{1}[1]{\hypersetup{linkcolor=black}}%
    }%
  } 
}

%------------------------------------------------------------------------------
%   TÍTULOS DE PARTE
%------------------------------------------------------------------------------

% Parte numerada en la tabla de contenido
\newcommand{\@mypartnumtocformat}[2]{%
\setlength\fboxsep{0pt}%
\noindent\colorbox{black!20}{\strut\parbox[c][.8cm]{\ecart}{\color{black!70}\Large\bfseries\centering#1}}\hskip\esp\colorbox{black}{\strut\parbox[c][.8cm]{\linewidth-\ecart-\esp}{\Large\centering\vphantom{é}\smash{#2}}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Parte no numerada en la tabla de contenido
\newcommand{\@myparttocformat}[1]{%
\setlength\fboxsep{0pt}%
\noindent\colorbox{black!40}{\strut\parbox[c][.8cm]{\linewidth}{\Large\centering#1}}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength\esp
\setlength\esp{4pt}
\newlength\ecart
\setlength\ecart{1.2cm-\esp}
\newcommand{\thepartimage}{}%
\newcommand{\partimage}[1]{\renewcommand{\thepartimage}{#1}}%
\def\@part[#1]#2{%
\ifnum \c@secnumdepth >-2\relax%
\refstepcounter{part}%
\addcontentsline{toc}{part}{\texorpdfstring{\protect\@mypartnumtocformat{\thepart}{#1}}{\partname~\thepart\ ---\ #1}}
\else%
\addcontentsline{toc}{part}{\texorpdfstring{\protect\@myparttocformat{#1}}{#1}}%
\fi%
\startcontents%
\markboth{}{}%
{\thispagestyle{empty}%
\begin{tikzpicture}[remember picture,overlay]%
    \node at (current page.north west){\begin{tikzpicture}[remember picture,overlay]%   
        \coordinate (A) at ($(current page.east)+(0,2.5)$);
        \coordinate (B) at (current page.south west);
        \draw[black!70,name path=A--B] (A) -- (B);
        \coordinate (C) at ($(current page.west)+(0,-2.5)$);
        \coordinate (D) at ($(current page.south)+(2,0)$);
        \draw[black!90,name path=C--D] (C) -- (D);
        \path [name intersections={of=A--B and C--D,by=E}];
        
        \fill[black!80] (0cm,0cm) rectangle (\paperwidth,-\paperheight);
        
        \fill[black!70] ($(current page.east)+(0,2.5)$) -- (current page.south east) -- (current page.south west) -- cycle;
        \fill[black!90] ($(current page.west)+(0,-2.5)$) -- (current page.south west) -- ($(current page.south)+(2,0)$) -- cycle;
        \fill[black!60] (current page.south west) -- ($(current page.south)+(2,0)$) -- (E) -- cycle;
        \node[right,inner sep=0pt] at ($(current page.west)+(2,8)$) {\color{white}\scalebox{20}{\bfseries\@Roman\c@part}};
        \node[right] at ($(current page.west)+(2,0.75)$) {\parbox[t][][t]{15cm}{\strut\raggedright\color{white}\fontsize{56}{56}\bfseries#2}};
    \end{tikzpicture}};
\end{tikzpicture}}%
\@endpart}
\def\@spart#1{%
\startcontents%
\phantomsection
{\thispagestyle{empty}%
\begin{tikzpicture}[remember picture,overlay]%
    \node at (current page.north west){\begin{tikzpicture}[remember picture,overlay]%   
        \coordinate (A) at ($(current page.east)+(0,2.5)$);
        \coordinate (B) at (current page.south west);
        \draw[black!70,name path=A--B] (A) -- (B);
        \coordinate (C) at ($(current page.west)+(0,-2.5)$);
        \coordinate (D) at ($(current page.south)+(2,0)$);
        \draw[black!90,name path=C--D] (C) -- (D);
        \path [name intersections={of=A--B and C--D,by=E}];
        
        \fill[black!80] (0cm,0cm) rectangle (\paperwidth,-\paperheight);
        
        \fill[black!70] ($(current page.east)+(0,2.5)$) -- (current page.south east) -- (current page.south west) -- cycle;
        \fill[black!90] ($(current page.west)+(0,-2.5)$) -- (current page.south west) -- ($(current page.south)+(2,0)$) -- cycle;
        \fill[black!60] (current page.south west) -- ($(current page.south)+(2,0)$) -- (E) -- cycle;

        \node[right] at ($(current page.west)+(2,0.75)$) {\parbox[t][][t]{15cm}{\strut\raggedright\color{white}\fontsize{60}{60}\bfseries#1}};
    \end{tikzpicture}
    };
\end{tikzpicture}}
\addcontentsline{toc}{part}{\texorpdfstring{%
\setlength\fboxsep{0pt}%
% Apendice
\noindent\protect\colorbox{black!70}{\strut\protect\parbox[c][.8cm]{\linewidth}{\Large\protect\centering\vphantom{é}\smash{#1} \quad\mbox{}}}}{#1}}%
\@endpart}
\def\@endpart{\vfil\newpage
\if@twoside
\if@openright
\null
\thispagestyle{empty}%
\newpage
\fi
\fi
\if@tempswa
\twocolumn
\fi}


%------------------------------------------------------------------------------
%   MATEMÁTICAS
%------------------------------------------------------------------------------

% A mi parecer, es mejor estéticamente utilizar lo siguiente:
\AtBeginDocument{%
  \mathchardef\stdcomma=\mathcode`,
  \mathcode`,="8000
}
\begingroup\lccode`~=`, \lowercase{\endgroup\def~}{\stdcomma\,}

\DeclareSymbolFontAlphabet{\mathbbm}{AMSb}
\DeclareSymbolFontAlphabet{\mathbb}{bbold}%

% OPERADORES

% Conjuntos de números
\newcommand{\RR}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{R}}{\mathbbm{R}^{#1}}}}
\newcommand{\NN}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{N}}{\mathbbm{N}^{#1}}}}
\newcommand{\ZZ}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{Z}}{\mathbbm{Z}^{#1}}}}
\newcommand{\QQ}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{Q}}{\mathbbm{Q}^{#1}}}}
\newcommand{\CC}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{C}}{\mathbbm{C}^{#1}}}}
\newcommand{\PP}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{P}}{\mathbbm{P}^{#1}}}}
\newcommand{\HH}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{H}}{\mathbbm{H}^{#1}}}}
% valor esperado
\newcommand{\EE}{\ensuremath{\mathbbm{E}}}

% otros
\DeclareMathOperator{\Lap}{\mathcal{L}}
\DeclareMathOperator{\Var}{Var} % varience
\DeclareMathOperator{\Cov}{Cov} % covarience
\DeclareMathOperator{\E}{E} % expected
\DeclareMathOperator{\Gen}{gen} % generator
\DeclareMathOperator{\Dim}{dim} % dimension
\DeclareMathOperator{\Ima}{Im} % imagen
\DeclareMathOperator{\Det}{det} % determinante
\DeclareMathOperator{\Adj}{adj} % adjunta
\DeclareMathOperator{\Nuc}{Nu} % Nucleo de t.l
\newcommand{\matrizmn}{\mathcal{M}_{m\times n} (\RR)} % conjunto de matrices
\DeclareMathOperator{\proy}{proy} 

\newcommand{\REN}[1][]{\ensuremath{\ifstrempty{#1}{\widetilde{\mathcal{R}}}{\widetilde{\mathcal{R}}_{#1}}}}
\newcommand{\COL}[1][]{\ensuremath{\ifstrempty{#1}{\widetilde{\mathcal{C}}}{\widetilde{\mathcal{C}}_{#1}}}}

\newtheoremstyle{myplain}
  {1.2\topsep}   % 
  {1.2\topsep}   % 
  {}  % 
  {0pt}       % 
  {\bfseries} % 
  {:}         % 
  {5pt plus 1pt minus 1pt} % 
  {\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}%                                     % Especifica el encabezado del teorema (se puede dejar vacía, lo que significa "normal")

\theoremstyle{myplain}

\newtheorem{theorem}{Teorema}[section]
\newtheorem{axiom}{Axioma}[section]
\newtheorem{lemma}{Lema}[section]
\newtheorem{proposition}{Proposición}[section]
\newtheorem{corollary}{Corolario}[section]
\newtheorem{definition}{Definición}[section]
\newtheorem{example}{Ejemplo}[section]
\newtheorem*{examples}{Ejemplos}
\newtheorem{observation}{Observación}[section]
\newtheorem*{remark}{Nota}
\newtheorem*{notation}{Notación}
\newtheorem*{commentary}{Comentario}
\newtheorem*{convention}{Convención}
\newtheorem{problem}{Problema}
\newtheorem*{Problem}{Problema}

\newcommand{\demostracion}{\noindent\textbf{Demostración:\hspace{5pt plus 1pt minus 1pt}}}

\newcommand{\solucion}{\noindent\textbf{Solución:\hspace{5pt plus 1pt minus 1pt}}}
