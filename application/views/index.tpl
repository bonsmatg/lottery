{include file="template_smarty/header.tpl" }

 <div class="Officia-section">
 	 <div class="container">
		 <div class="Officia-section-info">
             <div class="col-md-6 Officia-section-part-1">
                 <h3>Numbers <small>{$type}</small></h3>
                 <div class="row">
                     <form class="form-inline" action="/home/getDataByDate/{$type}" method="post">
                         <div class="form-group">
                             <label for="mode">Mode</label>
                             <select class="form-control" name="mode">
                                 <option value="b" {if $strategy.method eq 'b'}selected="selected"{/if}>BBSS</option>
                                 <option value="s" {if $strategy.method eq 's'}selected="selected"{/if}>SSBB</option>
                                 <option value="o" {if $strategy.method eq 'o'}selected="selected"{/if}>OOEE</option>
                                 <option value="e" {if $strategy.method eq 'e'}selected="selected"{/if}>EEOO</option>
                                 <option value="c" {if $strategy.method eq 'c'}selected="selected"{/if}>CCMM</option>
                                 <option value="m" {if $strategy.method eq 'm'}selected="selected"{/if}>MMCC</option>
                             </select>
                         </div>
                         <div class="form-group">
                             <label for="times">Times</label>
                             <select class="form-control" name="times">
                                 <option value="1,2,6,15">Steady</option>
                                 <option value="1,2,6,18">Aggressive</option>
                             </select>
                         </div>
                         <div class="form-group">
                             <label for="date">Date</label>
                             <input name="date" value="{$date}" class="form_datetime form-control" required="required" type="text" placeholder="{$date}" size="15">
                             <script type="text/javascript">
                                 $(".form_datetime").datetimepicker({
                                     format: "yyyy-mm-dd",
                                     autoclose: true,
                                     todayBtn: true,
                                     endDate: new Date(),
                                     minView: 'month'
                                 });
                             </script>
                         </div>
                         <div class="form-group">
                             <button type="submit" class="btn btn-primary">Submit</button>
                         </div>
                     </form>
                 </div>
                 <br>
                 <div class="row">
                     <form name="dataForm" method="post">
                         <div class="col-md-8">
                            <h2>{$date}</h2>
                         </div>
                         <input type="hidden" value="{$date}" name="date"/>
                         <input type="hidden" value="{$strategy.method}" name="mode">
                         <div class="col-md-2">
                             <button class="btn btn-warning" onclick="getPre()" type="submit">Previous</button>
                         </div>
                     <div class="col-md-2">
                         <button class="btn btn-info pull-right" onclick="getNext()" type="submit" {if $today == $date}disabled="disabled"{/if}>Next</button>
                     </div>
                     </form>
                     <script>
                     {literal}
                         function getPre(){
                     {/literal}
                             document.dataForm.action = "/home/getPreNextData/{$type}/-1";
                             document.dataForm.submit();
                     {literal}
                         }
                         function getNext(){
                     {/literal}
                             document.dataForm.action = "/home/getPreNextData/{$type}/1";
                             document.dataForm.submit();
                     {literal}
                         }
                     {/literal}
                     </script>
                 </div>
                 <br>
                 <div class="row">
                 <table class="table table-striped table-bordered table-hover table-condensed">
					 <tr>
						 <th>NO.</th>
						 <th>Time</th>
						 <th>1st.</th>
						 <th>2nd.</th>
						 <th>3rd.</th>
						 <th>4th.</th>
						 <th>5th.</th>
					 </tr>
                     {foreach from=$data[0] item=item}
                         <tr>
                             <td>{$item.num}</td>
                             <td>{$item.time}</td>
                             <td class="{if $item.first.info.result gt 0}danger{else}info{/if}">{$item.first.num}</td>
                             <td class={if $item.second.info.result gt 0}"danger"{else}"info"{/if}>{$item.second.num}</td>
                             <td class={if $item.third.info.result gt 0}"danger"{else}"info"{/if}>{$item.third.num}</td>
                             <td class={if $item.fourth.info.result gt 0}"danger"{else}"info"{/if}>{$item.fourth.num}</td>
                             <td class={if $item.last.info.result gt 0}"danger"{else}"info"{/if}>{$item.last.num}</td>
                        </tr>
                     {/foreach}
					 <tr>
						 <td></td>
						 <td>MAX</td>
						 <td>{$data[1]['first']}</td>
						 <td>{$data[1]['second']}</td>
						 <td>{$data[1]['third']}</td>
						 <td>{$data[1]['fourth']}</td>
						 <td>{$data[1]['last']}</td>
					 </tr>
                 </table>
                 </div>
             </div>
             <div class="col-md-6 Officia-section-part-2">
                 <h3>Statistics <small>{$type}</small></h3>
             </div>
             <div class="clearfix"> </div>
 	    </div>
    </div>
</div>

{include file="template_smarty/footer.tpl" }

