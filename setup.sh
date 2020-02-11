#=========================================================================
# setup.sh [-q|-n]
#=========================================================================
# This is the setup script for the UW COSIM simulator.

# As always, we make sure that we have sourced the basic brg setup script.

if [[ "x${SETUP_BRG}" != "xyes" ]]; then
  echo ""
  echo " The setup-brg.sh script has not been sourced yet. Please source"
  echo " setup-brg.sh and then resource this setup script."
  echo ""
  return
fi

#-------------------------------------------------------------------------
# Command line processing
#-------------------------------------------------------------------------

if [[ "x$1" == "x-q" ]] || [[ "x$2" == "x-q" ]]; then
  quiet="yes"
else
  quiet="no"
fi

#-------------------------------------------------------------------------
# Start
#-------------------------------------------------------------------------

print ""
print " Running bladerunner setup script"

#-------------------------------------------------------------------------
# alloy-gem5
#-------------------------------------------------------------------------

ver_num="v3.6.1"

print "  - bladerunner version number: ${ver_num}"
print "  - Setup bladerunner environment variables"

export BRG_BSG_BLADERUNNER_DIR="${BARE_PKGS_GLOBAL_PREFIX}/bladerunner"

#-------------------------------------------------------------------------
# Done
#-------------------------------------------------------------------------

# Set environment variable so we know this script has been sourced

export SETUP_BLADERUNNER="yes"

if [[ "x$1" != "x-n" ]] && [[ "x$2" != "x-n" ]]; then
  print ""
fi

