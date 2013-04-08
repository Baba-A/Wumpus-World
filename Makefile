%%% ==========================================
%%%   ABUBAKAR AWUMBILA
%%%   WUMUPS WORLD PROJECT - MAKE FILE
%%%   FILE:    makefile - otter
%%% ==========================================

# turn on silent mode
.SILENT:

# macro definitions

.SUFFIXES:	.in .out

HOME = ./
OTTER = < Path to Otter Installation>

OTTER_KB_SOURCES = GeneralKB.in InfoKB.in
QUERY_SOURCES = query.in 
SOURCES = $(OTTER_KB_SOURCES) $(QUERY_SOURCES)
OUTPUTS = $(QUERY_SOURCES:.in=.out) 
OTHER_FILES = Makefile 

TO_PRINT = $(SOURCES) 

## How to create an .out file from an .in file:

.in.out:
	echo 'Running $*...'
	-cat $(OTTER_KB_SOURCES) $*.in | $(OTTER) >$*.out
	echo '...done running $*!'

default:	$(OUTPUTS)

# print on laser printer for handing in
print: $(TO_PRINT)
	enscript -2rG -T4 -dcscopy $(TO_PRINT)

# EOF - Makefile for Wumpus world
