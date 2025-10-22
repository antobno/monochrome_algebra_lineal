\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{monochrome}[2024/03/14 Una plantilla que está destinada, en principio, a mis notas de álgebra lineal]

\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{book}
}

\ProcessOptions\relax

\LoadClass[a4paper, twoside]{book}

\RequirePackage[spanish, es-noshorthands, es-tabla, es-lcroman]{babel}


% =========================================================
%     PAQUETES NECESARIOS
% =========================================================

\RequirePackage{ifthen}  % Proporciona sentencias condicionales.
\RequirePackage{etoolbox}  % Herramientas avanzadas de programación para LaTeX.
\RequirePackage{floatrow} % Proporciona herramientas avanzadas para flotadores.
\RequirePackage[section]{placeins} % Evita que los flotadores lleguen a las secciones transversales.
\RequirePackage{graphicx}  % Para incluir y manipular imágenes.
\RequirePackage[font=normalsize]{subfig}  % Para subfiguras o figuras más complejas.
\RequirePackage{tabularx}  % Tablas de ancho flexible.
\RequirePackage{nicematrix} % Para crear tablas complejas
\RequirePackage{booktabs}  % Estilo profesional para tablas.
\RequirePackage{makecell} % Construye celdas locales.
\RequirePackage{caption}  % Personalización de títulos de tablas y figuras.
\RequirePackage[inline]{enumitem}  % Personalización de listas.
\RequirePackage{tasks}  % Personalización de listas en multicolumnas.
\RequirePackage{multienum}  %.sty
\RequirePackage{amsmath, amsfonts, amssymb, amsthm, mathtools}  % Expresiones matemáticas avanzadas y símbolos matemáticos extendidos.
\RequirePackage{eqparbox}  % Principalmente para nombres de ecuaciones
\RequirePackage[dvipsnames,table]{xcolor}  % Soporte extendido para colores.
\RequirePackage{tcolorbox}  % Crear cajas de colores y resaltadas.
\tcbuselibrary{most}  % Cargar la mayoría de las bibliotecas del paquete tcolorbox.

\RequirePackage[
    compact,
    newparttoc,
    newlinetospace,
]{titlesec}  % Personalización de títulos de secciones y capítulos.
\RequirePackage{titletoc}
\RequirePackage{hyperref}  % Hipervínculos y metadatos en PDF.
\RequirePackage{silence}  % Suprimir advertencias específicas de paquetes.
\RequirePackage{fontawesome5}  % Iconos de Font Awesome.
\RequirePackage{calc}  % Notación infija para aritmética.
\RequirePackage{footnotebackref} % Crea referencias posteriores de las notas al pie de página al texto
\RequirePackage{mdframed}
\RequirePackage{microtype}
\RequirePackage{fix-cm}
\RequirePackage[strict]{changepage}
\RequirePackage{ragged2e}
\RequirePackage{multicol}


\RequirePackage{tikz}  % Crear gráficos de alta calidad.
%%% Librerías de Tikz %%%
\usetikzlibrary{shapes}
\usetikzlibrary{positioning}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{calendar}
\usetikzlibrary{mindmap}
\usetikzlibrary{trees}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{calc}
\usetikzlibrary{intersections}
\usetikzlibrary{decorations.pathreplacing}
\usetikzlibrary{decorations.markings}
\usetikzlibrary{matrix}
\usetikzlibrary{backgrounds}
\usetikzlibrary{fit}
\usetikzlibrary{3d}
\usetikzlibrary{patterns,angles,quotes,math}
%\usetikzlibrary{snakes}
\RequirePackage{tikz-3dplot}
\usetikzlibrary{decorations}


\usepackage{pgfplots}
%%% Librerías de pgfplots y configuración %%%
\usepgfplotslibrary{colormaps}
\pgfplotsset{compat=newest}

\RequirePackage{qrcode}
\RequirePackage{pdfpages} % Para agregar documentos PDF (algunas páginas o incluso todo un documento)
\RequirePackage{emptypage} % Este paquete elimina encabezados y pies de página en páginas vacías entre capítulos. Importante para prólogos, introducción, etc.

\RequirePackage{marginnote} % Proporciona opciones para notas al margen
\RequirePackage{marginfix} % Proporciona opciones para notas al margen



% =========================================================
%     FUENTES
% =========================================================

\usepackage{fontspec}  % Requerido para fuentes personalizadas con XeLaTeX o LuaLaTeX.
\usepackage{unicode-math}
  
\setmainfont{XITS}
[    Extension = .otf,
   UprightFont = *-Regular,
      BoldFont = *-Bold,
    ItalicFont = *-Italic,
BoldItalicFont = *-BoldItalic,
]

\setmathfont{XITSMath-Regular}
[    Extension = .otf,
      BoldFont = XITSMath-Bold,
]

\newfontfamily\Lato[
  Ligatures       = TeX,
  UprightFont     = *-Regular,
  ItalicFont      = *-Italic,
  BoldFont        = *-Bold,
  BoldItalicFont  = *-BoldItalic,
]{Lato}

\newfontfamily\cabin[Path=fonts/, Extension = .otf,
   UprightFont = *-Regular,
      BoldFont = *-Bold,
    ItalicFont = *-Italic,
BoldItalicFont = *-BoldItalic,]{Cabin}

\newfontfamily\altone[Path=fonts/, Extension = .ttf,
   UprightFont = *-Regular,
      BoldFont = *-Bold,
    ItalicFont = *-Italic,
BoldItalicFont = *-BoldItalic]{Altone}

% A mi parecer, es mejor estéticamente utilizar lo siguiente:
\AtBeginDocument{%
  \mathchardef\stdcomma=\mathcode`,
  \mathcode`,="8000
}
\begingroup\lccode`~=`, \lowercase{\endgroup\def~}{\stdcomma\,}

\setmathfont{Latin Modern Math}[range=\sum]
\setmathfont{Latin Modern Math}[range=\nabla]
\DeclareMathSymbol{(}{\mathopen}{operators}{40}
\DeclareMathSymbol{)}{\mathclose}{operators}{41}
\setmathfont[range={\mathopen,\mathclose,\mathpunct,\mathord}]{Latin Modern Math}

% =========================================================

\newcommand{\demostracion}{\noindent\textbf{\fontencoding{T1}\fontfamily{phv}\selectfont\color{black}Demostración:\hspace{5pt plus 1pt minus 1pt}}}

\newcommand{\solucion}{\noindent\textbf{\fontencoding{T1}\fontfamily{phv}\selectfont\color{black}Solución:\hspace{5pt plus 1pt minus 1pt}}}


\newcommand{\TituloBox}[1]{\textbf{\fontencoding{T1}\fontfamily{phv}\selectfont\color{black}#1}}



% =========================================================
%     UNIDADES
% =========================================================
\setlength{\parskip}{0.8\baselineskip}
%\setlength{\parindent}{0ex}
\setlength{\headheight}{12.0pt}



% =========================================================
%     MARGENES
% =========================================================

\RequirePackage{geometry}

\geometry{
    %showframe,
	a4paper,
    asymmetric,
	ignorefoot,
	ignorehead,
    left=7.5cm,
	right=2cm,
	top=2.5cm,
	bottom=2.5cm,
	footskip=2\baselineskip,
	footnotesep=0mm,
	marginparwidth=5cm,
	marginparsep=7mm,
	headheight=0mm,
}
\reversemarginpar

\newcommand{\TOCPage}{
	%\fancyhfoffset[R]{0mm}
	\newgeometry{
		asymmetric,
	    ignorefoot,
	    ignorehead,
        left=5cm,
	    right=1.5cm,
	    top=2.5cm,
	    bottom=2.5cm,
		marginparwidth=0cm,
		marginparsep=0mm
	}
}



% =========================================================
%     ENCABEZADOS
% =========================================================

\RequirePackage{fancyhdr}

\fancypagestyle{fancy}{
	\renewcommand{\headrulewidth}{0pt}
	\fancyhf{}
	\fancyhfoffset[LE]{\marginparsep + \marginparwidth}
    \rhead[{\bfseries\protect\hyperref[toc-contents]{\selectfont\Lato\small\color{black}\thepage}}]{%
        \makebox[\textwidth][r]{\small\rightmark}%
    }
    % Ajuste en el encabezado izquierdo (páginas pares)
    \lhead[\small\leftmark]{%
        \hspace{-\marginparwidth -\marginparsep}{\bfseries\protect\hyperref[toc-contents]{\selectfont\Lato\small\color{black}\thepage}}%
    }
}

\def\chaptermark#1{\markboth{\protect\hyper@linkstart{link}{\@currentHref}{\selectfont\Lato\textbf{\color{black}\MakeUppercase{\chaptertitlename}~\thechapter} ~#1}\protect\hyper@linkend}{}}
\def\sectionmark#1{\markright{\protect\hyper@linkstart{link}{\@currentHref}{\selectfont\Lato\textbf{\color{black}SECCIÓN~\thesection} ~\MakeUppercase{#1}}\protect\hyper@linkend}}

\fancypagestyle{plain}{ % Estilo para cuando se especifica un estilo de página simple
	\fancyhead{} % Borrar encabezados
	\renewcommand{\headrulewidth}{0pt} % Eliminar línea de encabezado
}



% =========================================================
%     TABLA DE CONTENIDO
% =========================================================

\renewcommand{\tableofcontents}{
\pagestyle{empty} % No headers
%\newgeometry{left=0cm,asymmetric} % No left margin
\setcounter{tocdepth}{1} % TOC depth

{
\setlength{\parskip}{0pt}
\chapter*{\vspace*{-20\p@}%
\begin{tikzpicture}[remember picture, overlay]%
\fill[black!50] (current page.north west) coordinate (NW) --++(0,-0.15\paperheight) [bend left=-9] to ([shift={(\paperwidth,-.8*0.1\paperheight-2.96cm)}]NW) |- (NW)  --cycle;
\fill[black] (current page.north west) coordinate (NW) --++(0,-0.1\paperheight) [bend left=-10] to ([shift={(\paperwidth,-.8*0.1\paperheight-3.5cm)}]NW) |- (NW)  --cycle;
%
\pgftext[right,x=14cm,y=7cm]{\altone\color{white} 
\contentsname};%
\end{tikzpicture}}
\vspace{-5.5cm}

\@starttoc{toc}
}

\clearpage
}

% Estilo de texto de capítulo
\titlecontents{chapter}[-7em]{\selectfont\Lato \bfseries\addvspace{5ex}}%
{\MakeUppercase\chaptertitlename~~{\huge \thecontentslabel}\quad\Large \MakeUppercase}%
{}%
{\hfill\Large\thecontentspage}%

% Para arreglar la diferencia entre capítulo y apéndice
\newcommand\originalappendix{}
\let\originalappendix\appendix
\renewcommand\appendix{\originalappendix\addtocontents{toc}{\protect\appendixintoc}}
\newcommand\appendixintoc{\def\chaptertitlename{\appendixname}}

% Estilo de texto de sección
\titlecontents{section}[2em]{\addvspace{2pt}}%
{\thecontentslabel\qquad}%
{}%
{\hfill\thecontentspage}%

% Estilo de texto de subsección
\titlecontents{subsection}[3.2em]{}%
{\thecontentslabel\quad}%
{}%
{\hfill\thecontentspage}%



% =========================================================
%     SECCIONES EN EL DOCUMENTO
% =========================================================

\titleformat{\chapter}[block]
{} % format
{\begin{flushleft}%
	\begin{tikzpicture}[remember picture, overlay, inner sep=2mm]
		\node[yshift = 0.5cm, xshift = -0.5cm - \hoffset, left, font=\fontsize{1.2cm}{1.2cm}\selectfont\bfseries] (chapterLabel) {\chaptertitlename};
        \filldraw[black!80] ($(chapterLabel.west)+(-\textwidth,0)$) rectangle (current page.north east);
        \filldraw[white] (chapterLabel.south west) rectangle (chapterLabel.north east);
		\draw[black!80, ultra thick] (chapterLabel.south west) rectangle (chapterLabel.north east);
        \node[font=\fontsize{1cm}{1.2cm}\fontencoding{T1}\fontfamily{pag}\selectfont\bfseries\color{black!80}] at (chapterLabel) {\chaptertitlename};
        \node[white, font=\fontencoding{T1}\fontfamily{phv}\selectfont\bfseries, yshift=2.5cm, above of=chapterLabel] {\scalebox{16}{\thechapter}};
	\end{tikzpicture}
\end{flushleft}
}
{0pt} % 
{% 
	\blockmargin%
	\begin{adjustwidth}{-\marginparsep - \marginparwidth}{0mm}
		\begingroup
        \sloppy\FlushLeft
		\selectfont\Lato
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
	\begin{adjustwidth}{0mm}{-\marginparwidth}
		\FlushLeft
		\begingroup
        \selectfont\Lato
        \fontsize{1.5cm}{1.8cm}\selectfont\raggedright%
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

\titleformat{\section}
    {\normalfont\Large\bfseries}
    {\hspace{-2.375\marginparsep}\makebox[0.5in][r]{\color{black}\fontencoding{T1}\fontfamily{phv}\selectfont\Large\thesection}}
    {0.5\marginparsep}
    {\selectfont\Lato\raggedright}

\titleformat{\subsection}
    {\large\bfseries}
    {\hspace{-2.375\marginparsep}\makebox[0.5in][r]{\color{black}\fontencoding{T1}\fontfamily{phv}\selectfont\thesubsection}}
    {0.5\marginparsep}
    {\selectfont\Lato\raggedright}



% =========================================================
%     FLOTADORES
% =========================================================

\DeclareCaptionFont{myCaptionFont}{\bfseries\fontencoding{T1}\fontfamily{phv}\selectfont\color{black}}
\DeclareCaptionLabelSeparator{myCaptionLabelSeparator}{\hspace*{1.25ex}}
\captionsetup{
    labelfont=myCaptionFont,
    %justification=raggedright,
    singlelinecheck=false,
    labelsep=myCaptionLabelSeparator,
    strut=yes,%
    %hypcap=true, % Los enlaces apuntan a la parte superior de la figura
    %singlelinecheck=false,%
    %width=\marginparwidth,
    %indention=0pt, % Suprimir la sangría
    %parindent=0pt, % Suprimir el espacio entre los párrafos
}

\DeclareFloatVCode{parskip}{{\vspace{\parskip}}}
\newlength{\twoparskip}
\setlength{\twoparskip}{-\parskip}
\DeclareFloatVCode{twoparskip}{{\vspace\twoparskip}}
\DeclareFloatSeparators{marginparsep}{\hspace\marginparsep}

\floatsetup[figure]{
    %precode=twoparskip,
    margins=hangleft,
    floatwidth=\textwidth,
    font={normalsize},
    capposition=beside,
    captionskip=0mm,
    capbesideposition={top,left},
    capbesidewidth=sidefil,
    capbesidesep=marginparsep,%
    footposition=caption,
    footskip=0.5\baselineskip,
    footfont={small},
	postcode=twoparskip,
}

\floatsetup[table]{
    %precode=twoparskip,
    margins=hangleft,
    floatwidth=\textwidth,
    font={normalsize},
    capposition=beside,
    captionskip=0mm,
    capbesideposition={top,left},
    capbesidewidth=sidefil,
    capbesidesep=marginparsep,%
    footposition=caption,
    footskip=0.5\baselineskip,
    footfont={small},
	postcode=twoparskip,
}

\floatsetup[widefloat]{%
	capposition=bottom,
	captionskip=\baselineskip,
}

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
		\captionsetup*[table]{font={normalsize},hypcap=false}
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
		\captionsetup*[figure]{font={normalsize},hypcap=false}%
		\IfValueT{#1}{\vspace*{-2mm}\captionof{figure}{#1}}
	}
}

\newcommand{\infoBulle}[1]{
\marginElement{\justify
{\color{black}\vrule width 3pt}\colorbox{white}{
    \parbox[c]{\dimexpr\linewidth-3pt-2\fboxsep-2\fboxrule}{\vspace{1mm}\textbf{\textcolor{black}{\faInfoCircle}\qquad\fontencoding{T1}\fontfamily{pag}\selectfont\small Nota}\\[1.5mm]
    #1
    }\,\,\,}
}}

\newcommand{\noHyphen}{%
  \righthyphenmin=62
  \lefthyphenmin=62
}

% =========================================================
%     METADATOS
% =========================================================

\urlstyle{rm}
\hypersetup{
	pdfborder={1 1 0},
	pdfcreator={LuaLaTeX via Overleaf},
    pdftitle={Fundamentos y principios del álgebra lineal},
	pdfauthor={Antonio M. Mendoza},
    pdfsubject={Desde la teoría de espacios vectoriales y sus transformaciones lineales hasta la resolución de sistemas de ecuaciones lineales y la diagonalización de matrices.},
    %pdfpagemode=FullScreen,
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



% =========================================================
%     LISTAS
% =========================================================

\setlist{
  topsep=0mm,
}
\setlist[description]{font=\fontencoding{T1}\fontfamily{phv}\selectfont\scshape\color{black}}
\setlist[enumerate]{font=\fontencoding{T1}\fontfamily{phv}\selectfont\bfseries\color{black}}
\setlist[itemize]{label={$\bullet$}}

\settasks{
    label-format = \fontencoding{T1}\fontfamily{phv}\selectfont\bfseries\color{black},
    item-indent = 0.94cm,
}



% =========================================================
%     MATEMÁTICAS
% =========================================================

\newtcbtheorem[number within=section]{examplebox}{}{
    % Estilo del teorema
    theorem style=change apart,
    enhanced,
    lower separated=false,
    breakable,
    % Bordes
    boxrule=0pt,
    frame hidden,
    borderline north={1.5pt}{0pt}{black},
    borderline south={1.5pt}{0pt}{black},
    borderline east={1.5pt}{0pt}{black},
    % Colores
    colback=white,
    coltitle=black,
    % Título
    detach title,
    before title={Ejemplo~},
    after title={:},
    fonttitle=\bfseries\fontencoding{T1}\fontfamily{phv}\selectfont,
    boxed title style={colframe=white, colback=white, boxrule=0pt},
    % Texto
    fontupper=\normalsize,
    before upper={\abovedisplayskip=8pt\belowdisplayskip=8pt},
    % Márgenes
    left=-1mm,
    right=1mm,
    top=1mm,
    bottom=1mm,
    % Esquinas
    sharp corners,
    % Superposición
    overlay unbroken={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
    },
    overlay first={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
    },
    overlay middle={},
    overlay last={}
}{examplebox}

\newtcbtheorem[number within=section]{definicion}{}{
    % Estilo del teorema
    theorem style=change apart,
    enhanced,
    lower separated=false,
    breakable,
    % Bordes
    boxrule=0pt,
    frame hidden,
    % Colores
    colback=black!7!white,
    coltitle=black,
    % Título
    detach title,
    before title={Definición~},
    after title={:},
    fonttitle=\bfseries\fontencoding{T1}\fontfamily{phv}\selectfont,
    boxed title style={colframe=white, colback=white, boxrule=0pt},
    % Texto
    fontupper=\normalsize,
    before upper={\abovedisplayskip=8pt\belowdisplayskip=8pt},
    % Márgenes
    left=1mm,
    right=1mm,
    top=1mm,
    bottom=1mm,
    % Esquinas
    sharp corners,
    % Superposición
    overlay unbroken={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
    },
    overlay first={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
    },
    overlay middle={},
    overlay last={}
}{definicion}

\newtcbtheorem[number within=section]{prop}{}{
    % Estilo del teorema
    theorem style=change apart,
    enhanced,
    lower separated=false,
    breakable,
    % Bordes
    boxrule=0pt,
    frame hidden,
    borderline north={1.5pt}{0pt}{black},
    borderline south={1.5pt}{0pt}{black},
    %borderline east={1.5pt}{0pt}{black},
    % Colores
    colback=white,
    coltitle=black,
    % Título
    detach title,
    before title={Proposición~},
    after title={:},
    fonttitle=\bfseries\fontencoding{T1}\fontfamily{phv}\selectfont,
    boxed title style={colframe=white, colback=white, boxrule=0pt},
    % Texto
    fontupper=\normalsize,
    before upper={\abovedisplayskip=8pt\belowdisplayskip=8pt},
    % Márgenes
    left=-1mm,
    right=1mm,
    top=1mm,
    bottom=1mm,
    % Esquinas
    sharp corners,
    % Superposición
    overlay unbroken={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
    },
    overlay first={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
    },
    overlay middle={},
    overlay last={}
}{prop}

\newtcbtheorem[number within=section]{theorem}{}{
    % Estilo del teorema
    theorem style=change apart,
    enhanced,
    lower separated=false,
    breakable,
    % Bordes
    boxrule=0pt,
    frame hidden,
    %borderline north={1.5pt}{0pt}{blue},
    borderline south={1.5pt}{0pt}{black},
    %borderline east={1.5pt}{0pt}{black},
    % Colores
    colback=white,
    coltitle=black,
    % Título
    detach title,
    before title={Teorema~},
    after title={:},
    fonttitle=\bfseries\fontencoding{T1}\fontfamily{phv}\selectfont,
    boxed title style={colframe=white, colback=white, boxrule=0pt},
    % Texto
    fontupper=\normalsize,
    before upper={\abovedisplayskip=8pt\belowdisplayskip=8pt},
    % Márgenes
    left=-1mm,
    right=1mm,
    top=1mm,
    bottom=1mm,
    % Esquinas
    sharp corners,
    % Superposición
    overlay unbroken={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
        \draw[black,line width=1.5pt] ($(frame.north west)+(-3.5,-0.03)$) -- ($(frame.north east)+(0,-0.03)$);
    },
    overlay first={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
        \draw[black,line width=1.5pt] ($(frame.north west)+(-3.5,-0.03)$) -- ($(frame.north east)+(0,-0.03)$);
    },
    overlay middle={},
    overlay last={}
}{theorem}

\newtcbtheorem[number within=section]{corollary}{}{
    % Estilo del teorema
    theorem style=change apart,
    enhanced,
    lower separated=false,
    breakable,
    % Bordes
    boxrule=0pt,
    frame hidden,
    %borderline north={1.5pt}{0pt}{blue},
    borderline south={1.5pt}{0pt}{black},
    borderline east={1.5pt}{0pt}{black},
    % Colores
    colback=white,
    coltitle=black,
    % Título
    detach title,
    before title={Corolario~},
    after title={:},
    fonttitle=\bfseries\fontencoding{T1}\fontfamily{phv}\selectfont,
    boxed title style={colframe=white, colback=white, boxrule=0pt},
    % Texto
    fontupper=\normalsize,
    before upper={\abovedisplayskip=8pt\belowdisplayskip=8pt},
    % Márgenes
    left=-1mm,
    right=1mm,
    top=1mm,
    bottom=1mm,
    % Esquinas
    sharp corners,
    % Superposición
    overlay unbroken={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
        \draw[black,line width=1.5pt] ($(frame.north west)+(-3.5,-0.03)$) -- ($(frame.north east)+(0,-0.03)$);
    },
    overlay first={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
        \draw[black,line width=1.5pt] ($(frame.north west)+(-3.5,-0.03)$) -- ($(frame.north east)+(0,-0.03)$);
    },
    overlay middle={},
    overlay last={}
}{corollary}

\newtcbtheorem[number within=section]{lemma}{}{
    % Estilo del teorema
    theorem style=change apart,
    enhanced,
    lower separated=false,
    breakable,
    % Bordes
    boxrule=0pt,
    frame hidden,
    borderline east={1.5pt}{0pt}{black},
    % Colores
    colback=black!7!white,
    coltitle=black,
    % Título
    detach title,
    before title={Lema~},
    after title={:},
    fonttitle=\bfseries\fontencoding{T1}\fontfamily{phv}\selectfont,
    boxed title style={colframe=white, colback=white, boxrule=0pt},
    % Texto
    fontupper=\normalsize,
    before upper={\abovedisplayskip=8pt\belowdisplayskip=8pt},
    % Márgenes
    left=1mm,
    right=1mm,
    top=1mm,
    bottom=1mm,
    % Esquinas
    sharp corners,
    % Superposición
    overlay unbroken={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
    },
    overlay first={
        \node[left, minimum width=2cm, anchor=east, xshift=-0.5\marginparsep, yshift=-0.348cm] at (frame.north west) {\tcbtitle};
    },
    overlay middle={},
    overlay last={}
}{lemma}

% FUENTES

\DeclareSymbolFontAlphabet{\mathbbm}{AMSb}
\DeclareMathAlphabet{\mathcalm}{OMS}{cmsy}{m}{n}

% OPERADORES

% Conjuntos de números
\newcommand{\RR}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{R}}{\mathbbm{R}^{#1}}}}
\newcommand{\NN}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{N}}{\mathbbm{N}^{#1}}}}
\newcommand{\ZZ}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{Z}}{\mathbbm{Z}^{#1}}}}
\newcommand{\QQ}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{Q}}{\mathbbm{Q}^{#1}}}}
\newcommand{\CC}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{C}}{\mathbbm{C}^{#1}}}}
\newcommand{\PP}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{P}}{\mathbbm{P}^{#1}}}}
\newcommand{\HH}[1][]{\ensuremath{\ifstrempty{#1}{\mathbbm{H}}{\mathbbm{H}^{#1}}}}

\DeclareMathOperator{\Gen}{gen} % generator
\DeclareMathOperator{\Dim}{dim} % dimension
\DeclareMathOperator{\Ima}{Im} % imagen
\DeclareMathOperator{\adj}{adj} % adjunta
\DeclareMathOperator{\Nuc}{Nu} % Nucleo de t.l
\newcommand{\matrizmn}{\mathcalm{M}_{m\times n} (\RR)} % conjunto de matrices
\DeclareMathOperator{\proy}{proy}



% =========================================================
%     MACROS Y COMANDOS
% =========================================================

\newenvironment{nscenter}
 {\parskip=5pt\par\nopagebreak\centering}
 {\par\noindent\ignorespacesafterend}

\newenvironment{matriz}
 {\belowdisplayshortskip=-2pt\belowdisplayskip=-0.5pt\vspace{-0.1cm}\begin{equation}}
 {\end{equation}\noindent\ignorespacesafterend}
 
\newenvironment{matrizn}
 {\belowdisplayshortskip=-2pt\belowdisplayskip=-0.5pt\vspace{-0.1cm}\begin{equation*}}
 {\end{equation*}\noindent\ignorespacesafterend}

\newcommand{\eqtext}[3][l]{%
    \eqmakebox[#2][#1]{#3}%
}



% =========================================================
%     SUPRIMIR ADVERTENCIAS INNECESARIAS
% =========================================================


\WarningsOff[caption]  % Suprimir advertencias del paquete caption.
\WarningsOff[unicode-math]
\WarningsOff[fancyhdr]