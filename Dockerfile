FROM alpine:edge
WORKDIR /root
RUN apk add git lazygit fzf curl neovim ripgrep alpine-sdk  && \
    git clone https://github.com/LazyVim/starter ~/.config/nvim
ENTRYPOINT ["nvim"]

