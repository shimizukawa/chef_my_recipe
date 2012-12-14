require_recipe "mercurial"

mercurial_ext 'https://bitbucket.org/tksoh/hgshelve/raw/tip/hgshelve.py'
mercurial_ext 'https://bitbucket.org/durin42/histedit/raw/tip/hg_histedit.py'
mercurial_ext 'https://bitbucket.org/birkenfeld/hgbb/raw/tip/hgbb.py'

template node.hgrc.path do
  source 'hgrc.erb'
end
