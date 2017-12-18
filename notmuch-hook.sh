#!/bin/sh
notmuch new

# retag all "new" messages "inbox" and "unread"
notmuch tag +inbox -new -- tag:new

# tag all messages from "me" as sent and remove tags inbox and unread
notmuch tag -new -inbox +sent -- from:alexforsale@yahoo.com or from:christian.alexander@windowslive.com or from:alexarians@gmail.com or from:christian.alexander@ymail.com or from:christian.alexander@rocketmail.com or from:elasrofxela.alexander@yahoo.co.id or from:elasrofxela.alexander@gmail.com

# tag newsletters, but dont show them in inbox
notmuch tag +newsletter -unread -new -- from:info@*kaskusnetwork.com
notmuch tag +newsletter -unread -new -- from:noreply*@plus.google.com
notmuch tag +newsletter -unread -new -- from:notification*@facebookmail.com
notmuch tag +newsletter -unread -new -- from:notification@newsletters.ello.co
notmuch tag +newsletter -unread -new -- from:no-reply@twitch.tv
notmuch tag +newsletter -unread -new -- from:info@mapmyfitness*
notmuch tag +newsletter -unread -new -- from:*@geocaching.com
notmuch tag +newsletter -unread -new -- from:*@umanoapp.com
notmuch tag +newsletter -unread -new -- from:*@*vimeo.com
notmuch tag +newsletter -unread -new -- from:*@mentor.com
notmuch tag +newsletter -unread -new -- from:info@*runkeeper.com
notmuch tag +newsletter -unread -new -- from:*@*qualcomm.com
notmuch tag +newsletter -unread -new -- from:news@sonymobileemail.com
notmuch tag +newsletter -unread -new -- from:newsletter@themonroeinstitute.org
notmuch tag +newsletter -unread -new -- from:*@*quoramail.com
notmuch tag +newsletter -unread -new -- from:digest-noreply@*quora.com
notmuch tag +newsletter -unread -new -- from:*@flipboard.com

# tag important
notmuch tag +important -- from:no-reply@accounts.google.com
notmuch tag +important -- from:no-reply@cc.yahoo-inc.com
notmuch tag +important -- from:no-reply@facebookmail.com
notmuch tag +important -- from:no-reply@github.com

# logs
notmuch tag +logs -unread -new -- subject:Cron" "*

# jobs
notmuch tag +jobs -unread -new -- from:*@jobs*.*
notmuch tag +jobs -unread -new -- from:*@karir.com

# spam
notmuch tag +spam +delete -unread -new -- from:*@linkrefferal.com
notmuch tag +spam +delete -unread -new -- from:*@fancy.com
notmuch tag +spam +delete -unread -new -- from:*@*webhost.com

# mystuffs
notmuch tag +github -unread -- from:notification@github.com

# family
notmuch tag +family -unread -- from:lyndhalexander*
