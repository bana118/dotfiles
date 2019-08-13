# change pokemon background image

function pokemon() {
    if [ $# -eq 1 ]; then
        if [ $1 -lt 10 ];then
            NUM="00${1}"
        elif [ $1 -lt 100 ];then
            NUM="0${1}"
        else
            NUM=$1
        fi
        command osascript ~/Documents/pokemonsh/pokemon.scpt $NUM
    fi
    if [ $# -eq 0 ]; then
        RAND=$(( $RANDOM % 719 ))
        RAND2=$(( $RAND + 1))
        if [ $RAND2 -lt 10 ];then
            NUM="00${RAND2}"
        elif [ $RAND2 -lt 100 ];then
            NUM="0${RAND2}"
        else
            NUM=$RAND2
        fi
        command osascript ~/Documents/pokemonsh/pokemon.scpt $NUM
    fi
}
pokemon

