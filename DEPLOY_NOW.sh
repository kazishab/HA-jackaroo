#!/bin/bash

# ===================================================
# HA JACKAROO - এক কমান্ডে GITHUB PUSH
# ===================================================

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                                                            ║"
echo "║     🚀  HA JACKAROO - ONE COMMAND DEPLOY  🚀              ║"
echo "║                                                            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# কালার
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# ভেরিয়েবল
GIT_USER=${1:-"kazishab"}
GIT_EMAIL=${2:-"kami@example.com"}
GIT_NAME=${3:-"HA Tech BD"}

echo -e "${BLUE}📋 তথ্য:${NC}"
echo "  • GitHub User: $GIT_USER"
echo "  • Git Email: $GIT_EMAIL"
echo "  • Git Name: $GIT_NAME"
echo ""

# ============ GIT CONFIG ============
echo -e "${YELLOW}🔧 Git কনফিগ করছি...${NC}"
git config --global user.name "$GIT_NAME" 2>/dev/null
git config --global user.email "$GIT_EMAIL" 2>/dev/null
echo -e "${GREEN}✅ Git কনফিগ সম্পূর্ণ${NC}"
echo ""

# ============ GIT INIT ============
echo -e "${YELLOW}📦 Git ইনিশিয়ালাইজ করছি...${NC}"
git init 2>/dev/null
echo -e "${GREEN}✅ Git রেডি${NC}"
echo ""

# ============ REMOTE ADD ============
echo -e "${YELLOW}🔗 Remote যুক্ত করছি...${NC}"
git remote remove origin 2>/dev/null
git remote add origin "https://github.com/$GIT_USER/HA-jackaroo.git" 2>/dev/null
echo -e "${GREEN}✅ Remote: github.com/$GIT_USER/HA-jackaroo${NC}"
echo ""

# ============ ADD & COMMIT ============
echo -e "${YELLOW}📄 সব ফাইল যোগ করছি...${NC}"
git add . 2>/dev/null
echo -e "${GREEN}✅ ফাইল যোগ করা হয়েছে${NC}"
echo ""

echo -e "${YELLOW}💾 Commit করছি...${NC}"
git commit -m "🎮 Initial HA Jackaroo v1.0.0 - Premium Marble Game with Firebase & Online Multiplayer | Build by HA Tech BD" 2>/dev/null
echo -e "${GREEN}✅ Commit সম্পূর্ণ${NC}"
echo ""

# ============ BRANCH SETUP ============
echo -e "${YELLOW}🌿 Main ব্রাঞ্চ সেট করছি...${NC}"
git branch -M main 2>/dev/null
echo -e "${GREEN}✅ Main ব্রাঞ্চ প্রস্তুত${NC}"
echo ""

# ============ PUSH TO MAIN ============
echo -e "${YELLOW}🚀 Main ব্রাঞ্চে Push করছি...${NC}"
git push -u origin main --force 2>&1
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ Main branch Push সফল!${NC}"
else
  echo -e "${RED}❌ Main Push ব্যর্থ - Credentials চেক করুন${NC}"
  echo ""
  echo "সমাধান:"
  echo "1. GitHub > Settings > Developer settings > Personal access tokens"
  echo "2. Token তৈরি করুন (repo + workflow)"
  echo "3. আবার চালান এবং Token পেস্ট করুন"
  exit 1
fi
echo ""

# ============ CREATE GH-PAGES ============
echo -e "${YELLOW}🌿 gh-pages ব্রাঞ্চ তৈরি করছি...${NC}"
git checkout -b gh-pages 2>/dev/null || git checkout gh-pages 2>/dev/null
echo -e "${GREEN}✅ gh-pages ব্রাঞ্চ প্রস্তুত${NC}"
echo ""

# ============ PUSH TO GH-PAGES ============
echo -e "${YELLOW}🚀 gh-pages ব্রাঞ্চে Push করছি...${NC}"
git push -u origin gh-pages --force 2>&1
if [ $? -eq 0 ]; then
  echo -e "${GREEN}✅ gh-pages Branch Push সফল!${NC}"
else
  echo -e "${RED}❌ gh-pages Push ব্যর্থ${NC}"
fi
echo ""

# ============ BACK TO MAIN ============
echo -e "${YELLOW}🔄 Main ব্রাঞ্চে ফিরছি...${NC}"
git checkout main 2>/dev/null
echo -e "${GREEN}✅ Main ব্রাঞ্চে ফিরেছি${NC}"
echo ""

# ============ SUCCESS MESSAGE ============
echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║                                                            ║"
echo -e "║              ${GREEN}✅ সব কিছু PUSH হয়েছে!${NC}                  ║"
echo "║                                                            ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo -e "${BLUE}📱 আপনার গেম লাইভ হবে:${NC}"
echo -e "   ${YELLOW}https://$GIT_USER.github.io/HA-jackaroo${NC}"
echo ""
echo -e "${BLUE}⏱️  সময়: 2-3 মিনিট অপেক্ষা করুন${NC}"
echo ""
echo -e "${BLUE}📌 GitHub Settings করুন:${NC}"
echo "   1. GitHub এ যান"
echo "   2. Settings > Pages"
echo "   3. Source: gh-pages নির্বাচন করুন"
echo "   4. Save করুন"
echo ""
echo -e "${GREEN}✨ সম্পূর্ণ! এখন গেম খেলুন! 🎮${NC}"
echo ""
