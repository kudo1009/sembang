
[1mFrom:[0m /home/ubuntu/workspace/bolehboleh7/app/controllers/posts_controller.rb @ line 38 PostsController#create:

    [1;34m22[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m23[0m:   @post = [1;34;4mPost[0m.new([35mcontent[0m: params[[33m:content[0m],[35muser_id[0m: @current_user.id)
    [1;34m24[0m:   @post.user_id = current_user.id
    [1;34m25[0m: 
    [1;34m26[0m: 
    [1;34m27[0m:   [32mif[0m params[[33m:back[0m]
    [1;34m28[0m:     render [33m:new[0m
    [1;34m29[0m:     [32mreturn[0m
    [1;34m30[0m:   [32mend[0m
    [1;34m31[0m: 
    [1;34m32[0m:   [32munless[0m @post.valid?
    [1;34m33[0m:     render [33m:new[0m
    [1;34m34[0m:     [32mreturn[0m
    [1;34m35[0m:   [32mend[0m
    [1;34m36[0m: 
    [1;34m37[0m:   [32mif[0m params[[33m:send[0m]
 => [1;34m38[0m:     binding.pry
    [1;34m39[0m:     @post.save
    [1;34m40[0m:     [1;34;4mPostMailer[0m.post_mail(@post).deliver
    [1;34m41[0m:     flash[[33m:notice[0m] = [31m[1;31m"[0m[31m投稿を作成しました[1;31m"[0m[31m[0m
    [1;34m42[0m:     redirect_to @post
    [1;34m43[0m:     [32mreturn[0m
    [1;34m44[0m:   [32mend[0m
    [1;34m45[0m: 
    [1;34m46[0m:   render [33m:confirm[0m
    [1;34m47[0m: [32mend[0m

