module CapybaraHelpers
  def wait_for_ajax_to_finish
    page.document.synchronize do
      raise AjaxStillWorking unless page.evaluate_script('jQuery.active == 0')
    end
  end
end


class AjaxStillWorking < Capybara::ElementNotFound;end