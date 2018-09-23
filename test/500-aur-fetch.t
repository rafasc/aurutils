test_description='aur fetch'

SHARNESS_BUILD_DIRECTORY=${SHARNESS_BUILD_DIRECTORY:-$PWD/aurutils/usr/bin}
. ./sharness/sharness.sh

test_expect_success 'aur fetch -t (#323)' '
    test_when_finished "rm -r aurutils" &&
    aur fetch -t aurutils
'

test_expect_success 'aur fetch -g (#323)' '
    test_when_finished "rm -r aurutils" &&
    aur fetch -g aurutils &&
    git rev-parse --resolve-git-dir aurutils/.git
'

test_done
