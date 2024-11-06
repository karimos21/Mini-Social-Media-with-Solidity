// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniSocial {
    struct Post {
        string message;
        address author;
    }

    Post[] private posts;

    // fonction de publication d'un nouveau post
    function publishPost(string memory _message) public {
        // voir si le message n'est vide
        require(bytes(_message).length > 0, "Message cannot be empty");

        // créer un nouveau  Post et ajoutons au tableau
        Post memory newPost = Post(_message, msg.sender);
        posts.push(newPost);
    }

    // obtenir un message par son index
    function getPost(uint index) public view returns (string memory, address) {
        require(index < posts.length, "Post does not exist");
        Post memory post = posts[index];
        return (post.message, post.author);
    }

    // obtenir le total des postes
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}
