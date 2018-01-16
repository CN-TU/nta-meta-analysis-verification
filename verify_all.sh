DATA=$1
SPEC=$2

if [ -z "$SPEC" ]
then
    read -p "What is the path for the local git specification repo?" SPEC
fi

for paper in $(find $DATA/v2_papers/ -name "*.json")
do
    echo "Verifying $paper..."
    ./verify.sh $paper $SPEC
    if [ "$?" -ne 0 ]; then echo "Fail @ $paper"; exit 1; fi
    echo "Finished $paper"
    echo -e "---------------------------------\n\n\n"
done

rm -rf .r2 .r2.1  # remove all versions
(cd $SPEC && git worktree prune)  # cleanup created worktrees
