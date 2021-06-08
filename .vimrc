for f in split(glob('~/.config/vim/configs/*.vim'), '\n')
    exe 'source' f
endfor
